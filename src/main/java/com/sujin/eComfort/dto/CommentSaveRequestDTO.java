package com.sujin.eComfort.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentSaveRequestDTO {
	private int userId;
	private int boardId;
	private String content;
	private int commentId;
}
