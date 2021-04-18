package com.sujin.eComfort.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.model.Product;

@Service
public class BoardService {
	@Transactional(readOnly = true)
	public Page<Product> list(Pageable pageable) {
		return null;
	}
}
