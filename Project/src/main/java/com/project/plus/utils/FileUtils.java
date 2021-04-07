package com.project.plus.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import com.project.plus.controller.MainController;
import com.project.plus.domain.ClubVO;

import lombok.extern.log4j.Log4j;



@Log4j
public class FileUtils {

	public static ClubVO uploadFile(ClubVO vo, String uploadPath, MultipartFile[] file) throws Exception {

		for (int i=0; i<file.length; i++) {
			// 넘어온 파일이 있다면
			if (!file[i].getOriginalFilename().isEmpty() && !file[i].isEmpty()) {
				
				// 파일의 원본 이름을 얻고
				String orgFileName = file[i].getOriginalFilename();

				// 파일명 중복을 피하기 위해 고유한 id 생성 
				UUID uid = UUID.randomUUID();

				// 원본파일과 UUID 결합
				String newFileName = uid.toString() + "_" + orgFileName;

				// 파일을 저장할 폴더 생성(년 월 일 기준)
				String datePath = FileUtils.calcPath(uploadPath);

				try {
					// 지정해준 경로로 파일을 저장한다
					file[i].transferTo(new File(uploadPath + datePath + File.separator + newFileName));
					
					if(i==0) {	// 프로필 사진 = 메인사진 
						vo.setClubMain_pic(File.separator + "uploadImg" + datePath + File.separator + newFileName);
						String tPath = FileUtils.makeThumbnail(uploadPath, datePath, newFileName);
						vo.setClubThumb_pic(File.separator + "uploadImg" + tPath);
						
					} else if (i==1) {	// 상세정보 사진 
						vo.setClubContent1_pic(File.separator + "uploadImg" + datePath + File.separator + newFileName);
					} else {	// 리더소개 사진 
						vo.setClubContent2_pic(File.separator + "uploadImg" + datePath + File.separator + newFileName);
					}
				} catch (Exception e) {
					e.printStackTrace();
					log.info("파일 업로드 오류");
				}

			} else {
				if(i==0) {
					// 사진 수정시 main pic을 삭제했을 때 썸네일 컬럼을 null로 update
					vo.setClubMain_pic("");
					vo.setClubThumb_pic("");
					}
			}
			log.info("업로드 파일이 없습니다");
		}
		return vo;
	}//

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
	}

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


	//썸네일 이미지 생성
	public static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// Scalr.Method.AUTOMATIC : 이미지 가로, 세로 비율 유지 
		//  Scalr.Mode.FIT_TO_HEIGHT, 190 : 이미지 높이를 190px로 맞춤.
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 190);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		// 파일 확장자 추출 
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		// 썸네일 파일 생성 
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		// return 썸네일 경로 (replace는 윈도우의 경로 구분자 '\'를 '/'로 변환)
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
