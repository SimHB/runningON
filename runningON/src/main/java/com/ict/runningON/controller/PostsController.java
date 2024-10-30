package com.ict.runningON.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostsController {
	
	/* 조성주 */
	
	// 게시글 작성 페이지
	@GetMapping("/write")
	public ModelAndView boardwrite() {
		ModelAndView mv = new ModelAndView("posts/write");		
		return mv;
	}
	
	// 게시글 내용 페이지
	@GetMapping("/detail")
	public ModelAndView boarddetail() {
		ModelAndView mv = new ModelAndView("posts/detail");		
		return mv;
	}
	
	// 게시글 이미지
	@GetMapping("/uploadImage")
	@ResponseBody
	public String uploadImage(@RequestParam("file") MultipartFile file) {
	    // 파일 저장 경로 지정
	    String uploadDir = "/resources/upload/";

	    // 파일 이름 설정 및 저장
	    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
	    File saveFile = new File(uploadDir, fileName);
	    try {
	        file.transferTo(saveFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "error";
	    }

	    // 저장된 파일의 URL 반환
	    return "/resources/upload/" + fileName;
	}
}