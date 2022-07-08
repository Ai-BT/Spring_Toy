package com.wmk.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LiketoVO {

	private int likeNo;
	private int rBoardNum;
	private String id;
	private int like_check;

	// 현재 로직에서는 사용하지는 않지만
	// 로직을 변경할시 사용 할수있음
	// 좋아요 누른 게시판 번호와 좋아요를 누른 회원의 아이디가 같이 확인을 할수있음.

}