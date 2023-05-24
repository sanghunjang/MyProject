<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 전체 게수물의 개수..(중요 변수)
// select count(*) from 게시판테이블명 이용하여 전체 레코드 수를 구한다.
int totalCount=Integer.parseInt(request.getParameter("totalCount"));

// 한 페이지에 출력될 게시물 수(10개를 기준으로 잡는다.)
int countList=10;

// 한 화면에 출력될 페이지 수(통상적으로 10개 페이지를 나오게 함)
int countPage=10;

//현재 페이지(서버 프로그램을 통해 현재 보고자 하는 페이지 번호 받아온다.)
int pg = Integer.parseInt(request.getParameter("pg"));

// totalPage는 전체 페이지 수(전체 게시물/한 페이지에 출력될 게시물 수)
int totalPage=totalCount/countList;

if(totalCount%countList>0) {
   //totalCount(전체 게시물 수)를 countList(한 페이지에 출력될 게시물 수)로 나눈 나머지 값이
   //존재한다는 것은 한 페이지가 더 있다라는 의미.
   totalPage++;
}

int startPage = ((pg-1)/countList)*countPage+1;
// 현재 페이지를 기준으로 한 화면에서 시작 페이지 값을 보여준다.
// page-1을 한 이유는 10단위일 경우 예를 들어 10페이지면 0~10까지 보정하기 위해 -1을 한다.
// (-1을 지우고 실행하고 결과를 확인하면서 학습하세요.)
// 시작 값은 현재 페이지 값을 기준으로 10으로 나누어 0페이지부터 시작되는 것을 보정하기 위해 +1을 한다.

int endPage= startPage + countPage -1;
// 현재 페이지를 기준으로 한 화면에서 끝 페이지 값을 보여준다.
// 끝 값은 시작페이지에서 카운트페이지를 더한 후 1을 빼면 끝 페이지가 나온다.

// 시작 페이지와 끝 페이지의 값을 정확히 확인하기 위해서는 전체 게시물의 개수가 충분히 큰 값으로 설정해놓고 테스트 해본다.

if(totalPage<pg){
	// 현재 페이지가 전체 페이지보다 크다면.. 이런 경우는 출력될 페이지 범위를 벗어난
	// 현재의 페이지 의미
	// 따라서 현재페이지를 가장 끝 페이지 totalPage로 이동시킨다.
	pg=totalPage;
}
// 마지막 페이지 잔여 페이지 보정 역할
// 255 개의 게시물이 있을 경우 총 26페이지가 존재할 것이고, 22페이지가 있는 곳에는 21 에서 30 페이지 영역일 것입니다.
// 하지만 26 페이지까지이기 때문에 단순히 21 페이지에서 countPage 을 더하면 안된다는 것을 대번에 눈치 채셨을 겁니다. 
// 그래서 이 경우에도 마지막 페이지는 총 페이지 수로 대체를 해줘야 합니다.

if(endPage>totalPage){ // endPage가 totalPage보다 클 경우 endPage가 totalPage랑 같게 만든다. 
	endPage = totalPage;
}

// 처음 링크(2페이지 부터 이동시 활성화)
if(startPage > 1) {%>
	  <a href="getBoardList.do?page=1">처음</a>
<% }

// 이전 링크
if(pg > 1) {%>
	  <a href="getBoardList.do?page=<%= pg-1 %>">이전</a>
<% }

// 반복문을 이용하여 페이지리스트 생성. 현재 페이지번호를 강조하기 위해 b태그 사용
for(int iCount=startPage;iCount<=endPage;iCount++) {
	  if(iCount==pg) { %>
		<a href="getBoardList.do?page=<%= iCount %>"><b><%= iCount %></b></a>
	  <% }else { %>
		<a href="getBoardList.do?page=<%= iCount %>"><%= iCount %></a>
	  <% }
};

// 다음 링크
if(pg < totalPage) { %>
	  <a href="getBoardList.do?page=<%= pg+1 %>">다음</a>
<% }

// 끝 링크 
if(endPage < totalPage)  {%>
	  <a href="getBoardList.do?page=<%= totalPage %>">끝</a>
<% } %>