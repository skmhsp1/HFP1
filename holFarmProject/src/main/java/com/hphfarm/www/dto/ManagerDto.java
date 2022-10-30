package com.hphfarm.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ManagerDto {

	// 메인페이지 데이터
	private int ucount, pcount, frcount, totalpay, cnt, fresPay, eresPay, proPay;
	private String py_date;
	private Integer total;
	
	// 1:1문의 관련 데이터
	private String ci_title, ci_content, u_email, u_name,  ir_content;
	private int ci_no;
	
	// 메인페이지 월별 파종 추천 작물 관련
	private int cr_no;
	private String cr_name, cr_type, cr_season, cr_term, cr_recommend;
	private int onemonth, twomonth, thrmonth;
}
