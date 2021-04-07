package com.project.plus.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.project.plus.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class ProfileUtils {
	
	public static MemberVO profile(MemberVO vo, String uploadPath, MultipartFile file) throws Exception{
		//넘어온 파일이 있으면
		if (!file.getOriginalFilename().isEmpty() && !file.isEmpty()) {
			
			// 파일의 원본 이름을 얻고
			String propicName = file.getOriginalFilename();

			// 파일명 중복을 피하기 위해 고유한 id 생성 
			UUID uid = UUID.randomUUID();

			// 원본파일과 UUID 결합
			String newPicName = uid.toString() + "_" + propicName;

			// 파일을 저장할 폴더 생성(년 월 일 기준)
			String datePath = ProfileUtils.calcPath(uploadPath);
			
			file.transferTo(new File(uploadPath + datePath + File.separator + newPicName));
			vo.setMemberPic(File.separator + "uploadImg" + datePath + File.separator + newPicName);
			
			
			/*
			 * //저장할 파일준비 File target = new File(uploadPath + datePath, newPicName);
			 * 
			 * 
			 * String formatName = propicName.substring(propicName.lastIndexOf(".")+1);
			 * 
			 * String uploadedFileName = null;
			 */
			
			
		}else {
			vo.setMemberPic("");
		}
		
		return vo;

		
	}
	
	
	private static String calcPath(String uploadPath) {

		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// calendar 클래스의 월은 0~11이므로 +1
		// DecimalFormat("00") : 빈자리 0으로 채움
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);

		// return 연,월,일 폴더 경로
		return datePath;
	}//calcpath
	

	
	
	// 폴더 생성 함수
		// ...은 매개변수를 받으나 몇개인지 모를 때 쓴다
		private static void makeDir(String uploadPath, String... paths) {

			if (new File(uploadPath + paths[paths.length - 1]).exists()) {
				return;
			} // if

			for (String path : paths) {

				File dirPath = new File(uploadPath + path);

				if (!dirPath.exists()) {
					dirPath.mkdir();
				} // if

			} // for

		}// makeDir


}
