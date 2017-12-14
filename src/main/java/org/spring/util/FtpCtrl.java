package org.spring.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

public class FtpCtrl {

	public int upload(String localFilePath, String remoteFilePath, String fileName, HttpServletRequest request)
			throws Exception {

		FTPClient ftp = null; // FTP Client 객체
		FileInputStream fis = null; // File Input Stream
		File uploadfile = new File(localFilePath); // File 객체

		String url = "jaesay.dothome.co.kr";
		String id = "jaesay";
		String pwd = "jaesay123";
		String port = "21";

		int result = -1;

		try {
			ftp = new FTPClient(); // FTP Client 객체 생성
			ftp.setControlEncoding("UTF-8"); // 문자 코드를 UTF-8로 인코딩
			ftp.connect(url, Integer.parseInt(port)); // 서버접속 " "안에 서버 주소 입력 또는
														// "서버주소", 포트번호
			ftp.login(id, pwd); // FTP 로그인 ID, PASSWORLD 입력
			ftp.enterLocalPassiveMode(); // Passive Mode 접속일때
			ftp.changeWorkingDirectory(remoteFilePath); // 작업 디렉토리 변경
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 업로드 파일 타입 셋팅

			try {
				fis = new FileInputStream(uploadfile); // 업로드할 File 생성
				boolean isSuccess = ftp.storeFile(fileName, fis); // File 업로드

				if (isSuccess) {
					result = 1; // 성공
				} else {
					System.out.println("파일 업로드를 할 수 없습니다.");
				}
			} catch (IOException ex) {
				System.out.println("IO Exception : " + ex.getMessage());
			} finally {
				if (fis != null) {
					try {
						fis.close(); // Stream 닫기
						return result;

					} catch (IOException ex) {
						System.out.println("IO Exception : " + ex.getMessage());
					}
				}
			}
			ftp.logout(); // FTP Log Out
		} catch (IOException e) {
			System.out.println("IO:" + e.getMessage());
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect(); // 접속 끊기
					return result;
				} catch (IOException e) {
					System.out.println("IO Exception : " + e.getMessage());
				}
			}
		}
		return result;
	}

	public int delete(String remoteFilePath, String fileName, HttpServletRequest request)
			throws Exception {

		FTPClient ftp = null; // FTP Client 객체
		FileInputStream fis = null; // File Input Stream

		String url = "jaesay.dothome.co.kr";
		String id = "jaesay";
		String pwd = "jaesay123";
		String port = "21";

		int result = -1;

		try {
			ftp = new FTPClient(); // FTP Client 객체 생성
			ftp.setControlEncoding("UTF-8"); // 문자 코드를 UTF-8로 인코딩
			ftp.connect(url, Integer.parseInt(port)); // 서버접속 " "안에 서버 주소 입력 또는
														// "서버주소", 포트번호
			ftp.login(id, pwd); // FTP 로그인 ID, PASSWORLD 입력
			ftp.enterLocalPassiveMode(); // Passive Mode 접속일때
			ftp.changeWorkingDirectory(remoteFilePath); // 작업 디렉토리 변경
			ftp.setFileType(FTP.BINARY_FILE_TYPE); // 업로드 파일 타입 셋팅

			try {
				boolean isSuccess = ftp.deleteFile(fileName);// 파일삭제

				if (isSuccess) {
					result = 1; // 성공
				} else {
					System.out.println("파일을 삭제 할 수 없습니다.");
				}
			} catch (IOException ex) {
				System.out.println("IO Exception : " + ex.getMessage());
			} finally {
				if (fis != null) {
					try {
						fis.close(); // Stream 닫기
						return result;

					} catch (IOException ex) {
						System.out.println("IO Exception : " + ex.getMessage());
					}
				}
			}
			ftp.logout(); // FTP Log Out
		} catch (IOException e) {
			System.out.println("IO:" + e.getMessage());
		} finally {
			if (ftp != null && ftp.isConnected()) {
				try {
					ftp.disconnect(); // 접속 끊기
					return result;
				} catch (IOException e) {
					System.out.println("IO Exception : " + e.getMessage());
				}
			}
		}
		return result;
	}
}
