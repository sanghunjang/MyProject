package com.company.view.board;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.biz.user.User;

// REST컨트롤러를 만들기 위해서는 컨트롤러 클래스에 @Controller어노테이션이 아닌 @RestController를 쓴다.

// 컨트롤러는 메소드가 반환한 데이터를 자동으로 문자열 타입이나 Json타입으로 변환
@RestController
public class RESTController {
	
	// GET : SELECT  조회
	@GetMapping("/board")
	public User httpGet() {
		User findUser = User.builder()
							.id("1")
							.name("홍길동")
							.password("1234")
							.email("hong@hong.com")
							.build();
		return findUser;
	}
	
	// POST : INSERT  등록
	@PostMapping("/board")
	public String httpPost(User user) {
		return "Post 요청 처리 입력값 : "+user.toString();
	}
	
	// PUT : UPDATE  수정
	@PutMapping("/board")
	public String httpPut() {
		return "Put 요청 처리";
	}
	
	// DELETE : DELETE  삭제
	@DeleteMapping("/board")
	public String httpDelete() {
		return "Delete 요청 처리";
	}
	
}
