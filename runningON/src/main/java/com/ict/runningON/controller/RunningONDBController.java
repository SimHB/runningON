package com.ict.runningON.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.runningON.service.PostsService;
import com.ict.runningON.vo.PostsVO;

//@RestController
public class RunningONDBController {
//	@Autowired
//	private PostsService postsService;
//	
//	@RequestMapping(value = "/post_db_list", produces = "application/xml; charset=utf-8;")
//	@ResponseBody
//	public String getAjaxList() {
//		List<PostsVO> list = postsService.getPostList();
//		
//		if(list != null) {
//			StringBuffer sb = new StringBuffer();
//			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
//			sb.append("<posts>");
//			
//			for (PostsVO k : list) {
//				sb.append("<post>");
//				sb.append("<post_idx>" + k.getPost_idx() + "</post_idx>");
////				sb.append("<m_id>" + k.getM_id() + "</m_id>");
////				sb.append("<m_pw>" + k.getM_pw() + "</m_pw>");
////				sb.append("<m_name>" + k.getM_name() + "</m_name>");
////				sb.append("<m_age>" + k.getM_age() + "</m_age>");
////				sb.append("<m_reg>" + k.getM_reg() + "</m_reg>");
//				sb.append("</post>");
//			}
//			sb.append("</posts>");
//			return sb.toString();
//		}
//		return "fail";
//	}
}