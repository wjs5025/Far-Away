package com.ssafy.util;

import java.security.MessageDigest;
import java.security.SecureRandom;

public class Encrypt {
	public static void main(String[] args) {
		Encrypt encrypt = new Encrypt();
		
		/* 회원가입 */
		String pwd = "hello3123###!@!";
		System.out.println("pwd: " + pwd);
		
		// DB에 저장되어있는 salt 값(회원 가입 시 저장, 로그인 시 조회)
		String salt = encrypt.getSalt();
		System.out.println("salt: " + salt);
		
		String savedPwd = encrypt.getEncrypt(pwd, salt);
		/* 회원가입 끝 */
		
		/* 로그인 시작 */
		String inputPwd = "hello3!";
		String decryptPwd = encrypt.getEncrypt(inputPwd, salt);
		if (decryptPwd.equals(savedPwd)) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}
		/* 로그인 끝 */
	}
	
	public String getSalt() {
		// Random, byte 객체 생성
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[20];
		
		// 난수생성
		random.nextBytes(salt);
		
		//Byte to String (10진수 문자열로 변경)
		StringBuffer sb = new StringBuffer();
		byteToString(salt, sb);
		return sb.toString();
	}
	
	public String getEncrypt(String pwd, String salt) {
		String result = "";
		try {
			// SHA256 알고리즘 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			// pwd 와 salt 를 합친 문자열에 SHA 256 적용
			System.out.println("pwd+salt 적용 전: " + pwd + salt);
			md.update((pwd+salt).getBytes());
			byte[] pwdSalt = md.digest();
			
			// byte to string (10진수 문자열로 변경)
			StringBuffer sb = new StringBuffer();
			byteToString(pwdSalt, sb);
			
			result = sb.toString();
			System.out.println("pwd+salt 적용 후: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private void byteToString(byte[] pwdSalt, StringBuffer sb) {
		for (byte b : pwdSalt) {
			sb.append(String.format("%02x", b));
		}
	}

}
