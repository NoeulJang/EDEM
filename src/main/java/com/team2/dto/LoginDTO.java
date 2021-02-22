package com.team2.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class LoginDTO {
	
	private String id;
	private String pw;
	private boolean useCookie;

	public boolean isUseCookie() {
		return useCookie;
	}

}
