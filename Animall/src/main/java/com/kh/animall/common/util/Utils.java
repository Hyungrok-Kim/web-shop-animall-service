package com.kh.animall.common.util;

import org.springframework.stereotype.Controller;

@Controller
public class Utils {
	
	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url ){
		String pageBar = "";
		int pageBarSize = 5; //1,2,3,4,5 --> 6,7,8,9,10
		cPage = cPage==0?1:cPage; //페이지가 0이면 1로 설정
		
		//총페이지수 구하기 math.ceil을 통해 올림
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		
		//1.pageBar작성
		//pageBar순회용변수 즉 우리가 3페이지에 접속해도 1페이지부터 보이게 하는 방법
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){ //페이지가 1이라면 뒤로 못가게
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";
		}
		else { //그렇지 않다면 뒤로 갈 수 있게
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(cPage == pageNo ){ //현재페이지에 파란색 명암주기
				pageBar += "<li class='' style='background-color:none; border-none; color:white;'>";
				pageBar += "<a class='page-link' style='background-color:#997296 ; color:white; border : solid 1px #997296'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage,numPerPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; 
	}

}