package com.company.biz.user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //@getter,@Setter,@ToString,@EqualsAndHashCode,@AllArgsCunstructor 포함
@NoArgsConstructor // 기본 생성자 생성
@AllArgsConstructor // 모든 멤버변수 초기화하는 생성자 생성
@Builder // 빌더 패턴이 적용된 builder()메소드 생성
public class User {
	private String id;
	private String name;
	private String password;
	private String email;
}
