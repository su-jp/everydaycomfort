package com.sujin.eComfort.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommentSaveRequestDTO {
	private int userId;
	private int boardId;
	private String content;
	private int commentId;
}
