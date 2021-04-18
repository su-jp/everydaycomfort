package com.sujin.eComfort.controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sujin.eComfort.model.Product;

@Controller
public class ShoppingApiController {
	@GetMapping("/shop/{category}")
	public String callback(@PathVariable String category, Model model, @PageableDefault(size = 9) Pageable pageable) {
		String keyword = null;
		if (category.equals("furniture")) {
			keyword = "가구";
		} else if (category.equals("bedding")) {
			keyword = "침구";
		} else if (category.equals("lighting")) {
			keyword = "조명";
		} else if (category.equals("homedeco")) {
			keyword = "인테리어소품";
		} else if (category.equals("appliance")) {
			keyword = "생활가전";
		} else if (category.equals("kitchen")) {
			keyword = "주방용품";
		} else if (category.equals("bath")) {
			keyword = "욕실용품";
		}
		List<Product> requestList = callList(keyword);
		Page<Product> pagedList = conversion(requestList, pageable);
		model.addAttribute("list", pagedList);
		return "shopping/list";
	}

	private Page<Product> conversion(List<Product> list, Pageable pageable) {
		if (pageable.getOffset() >= list.size()) {
			return Page.empty();
		}
		int startIndex = (int) pageable.getOffset();
		int endIndex = (int) ((pageable.getOffset() + pageable.getPageSize()) > list.size() ? list.size()
				: pageable.getOffset() + pageable.getPageSize());
		return new PageImpl<Product>(list.subList(startIndex, endIndex), pageable, list.size());
	}

	private List<Product> callList(String keyword) {
		ApiKey apiKey = new ApiKey();
		String clientId = apiKey.getNaverClientKey();
		String clientSecret = apiKey.getNaverClientSecret();

		String text = null;
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text + "&display=40&start=1&sort=sim";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		String json = responseBody;

		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(json);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONArray item = (JSONArray) obj.get("items");

		List<Product> list = new ArrayList<Product>();
		for (int i = 0; i < item.size(); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			Product p = Product.builder().productId((String) tmp.get("productId")).title((String) tmp.get("title"))
					.image((String) tmp.get("image")).lprice(Integer.parseInt((String) tmp.get("lprice"))).build();
			if (p != null) {
				list.add(p);
			}
		}
		return list;
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
