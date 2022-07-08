package com.wmk.ex.vo;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResponseVO<T> {

	private int statusCode;
	private String message;
	private T data;

	public ResponseVO(int statusCode, T data) {
		this.statusCode = statusCode;
		this.data = data;
	}
}
