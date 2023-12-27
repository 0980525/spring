package com.ezen.www.Handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.www.domain.FileVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Component
@Slf4j
@AllArgsConstructor
public class FileHandler {
	
	//파일 객체를 파라미터로 받아서 flist로 리턴 
	//파일을 저장하고 fvo를 생성하는 역할 
	
	//실제 파일이 저장되는 경로
	private final String Up_DIR="D:\\_myProject\\_java\\_fileUpload";
	
	public List<FileVO> uploadFiles(MultipartFile[] files){
		
		
		List<FileVO> flist = new ArrayList<FileVO>();
		//multipartFile 받아서 FileVO형태로 저장한 후 list를 리턴
		//오늘 날짜로 경로(가변형태로 저장)
		LocalDate date = LocalDate.now();
		String today = date.toString();
		log.info(">>> today : "+today);
		
		//오늘 날짜 today의 폴더 구성
		today = today.replace("-", File.separator);
		//"D:\\_myProject\\_java\\_fileUpload + today " 경로 설정
		File folders = new File(Up_DIR,today);
		
		//exists() 있는지 체크
		if(!folders.exists()) {
			//mkdirs() -하위 모든 폴더 생성
			//mkdir() -폴더 하나 생성
			folders.mkdirs();
		}
		
		//리스트 설정 
		for(MultipartFile file : files) {
			FileVO fvo = new FileVO();
			
			fvo.setSave_dir(today); //Updir 제외 하위 오늘 날짜 경로만 set
			fvo.setFile_size(file.getSize()); //(file.size) return=>long
			log.info("getname>>>>>>>>>>>"+file.getName());
			log.info("getOriginalFilename>>>>>>>>>>>"+file.getOriginalFilename());
			
			//파일이름(originalName()) : 파일경로를 포함하고 있을 수도 있음
			String originalFileName = file.getOriginalFilename();
			String onlyFileName = originalFileName.substring(
					originalFileName.lastIndexOf(File.separator)+1);
			fvo.setFile_name(onlyFileName);
			
			//UUID 생성 - 중복 제거
			UUID uuid = UUID.randomUUID();
			log.info(">>>> UUID >>>>>{}",uuid.toString());
			String uuidStr = uuid.toString();
			fvo.setUuid(uuidStr);
			
			//<---fvo setthing 완료
			
			//디스크에 저장할 파일 객체를 생성 ->w저장
			//uuid_fileName / uuid_th_fileName
			String fullFileName = uuidStr+"_"+onlyFileName;
			File storeFile = new File(folders,fullFileName);
			
			//저장=>폴더가 없거나ㅡ 저장파일이 없다면 io Exception
			try {
				file.transferTo(storeFile);//저장
				if(isImageFile(storeFile)) {
					fvo.setFile_type(1);
					File thumbNail = new File(folders,uuidStr+"_th_"+onlyFileName);
					Thumbnails.of(storeFile).size(75,75).toFile(thumbNail);
				}
				//파일 타입을 결정 =>이미지 파일일때만 썸네일 성정
			} catch (Exception e) {
				log.info(" >>> file 저장 에러");
				e.printStackTrace();
			}
			flist.add(fvo);
		}
		return flist;
	}
	
	//tika 를 활용하여 파일 형식 체크, 이미지파일이 맞는지 확인
	
	public boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image")? true:false;
		}
}
