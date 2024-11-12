package com.ict.runningON.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.common.Paging;
import com.ict.runningON.service.MypageService;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.UsersVO;

@RestController
public class MypageAjaxController {

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private Paging paging;
	
	@RequestMapping("/mypage_ajax")
	@ResponseBody
	public Map<String, Object> getCreateGroup(HttpSession session,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String sortOrder){
		Map<String, Object> map = new HashMap<>();
		UsersVO uvo = (UsersVO) session.getAttribute("uvo");
		String user_id = uvo.getUser_id();
		List<RunGroupsVO> rungroups = mypageService.getCreateGroup(user_id);
		int count = rungroups.size();
		
		paging.setTotalRecord(count);
	    // 만약 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 적다면
	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	    	// 전체 페이지 수는 1개로 저장
	        paging.setTotalPage(1);
	    } else {
	    	// 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 크면
	    	// 전체 페이지 수 = (게시글 수/페이지 제한 수(5개)) + (나머지가 0보다 크면 1 아니면 0 더하기) == 14/5 + 1 = 3
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage() + 
	                            (paging.getTotalRecord() % paging.getNumPerPage() > 0 ? 1 : 0));
	    }
	    // 현재 페이지 cPage 로 저장
	    paging.setNowPage(cPage);
	    // 오프셋(페이지 블록당 넘어갈 페이지 수) = (limit * (현재 페이지-1))
	    // 예)	1페이지 : 5*(1-1)=0 즉 1페이지는 건너뛸 페이지 0개
	    //		2페이지 : 5*(2-1)=5 즉 2페이지는 건너뛸 페이지 5개
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    // 블록 계산
	    // 시작 블록 설정 ((현재페이지-1)/(한번에 담는 최대 블록수)) * (한번에 담는 최대 블록수) + 1
	    //					((1-1)/3)*3+1 = 1
	    paging.setBeginBlock(
	        (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    // 끝 블록 설정 (시작 블록 + 한번에 담는 최대 블록수 - 1) == ((1-1)/3)*3+1 = 1
	    //					
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }
	    
	    // sortOrder (최신순(newest), 인기순(popular))
	    String desc = "post_idx";
	    if(sortOrder.equals("newest")) {
	    	desc = "post_idx";
	    } else {
	    	desc = "post_views";
	    }
		map.put("list", rungroups);
	    map.put("paging", paging);
	    return map;
	}
	
	@RequestMapping("/mypage_ajax2")
	@ResponseBody
	public Map<String, Object> getjoinGroup(HttpSession session,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String sortOrder){
		Map<String, Object> map = new HashMap<>();
		UsersVO uvo = (UsersVO) session.getAttribute("uvo");
		String user_id = uvo.getUser_id();
		List<Integer> group_idx_list = mypageService.getJoinGroups(user_id);
		List<RunGroupsVO> rungroups = mypageService.getGroups(group_idx_list);
		int count = (rungroups != null) ? rungroups.size() : 0;
		count = rungroups.size();
		
		paging.setTotalRecord(count);
	    // 만약 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 적다면
	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	    	// 전체 페이지 수는 1개로 저장
	        paging.setTotalPage(1);
	    } else {
	    	// 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 크면
	    	// 전체 페이지 수 = (게시글 수/페이지 제한 수(5개)) + (나머지가 0보다 크면 1 아니면 0 더하기) == 14/5 + 1 = 3
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage() + 
	                            (paging.getTotalRecord() % paging.getNumPerPage() > 0 ? 1 : 0));
	    }
	    // 현재 페이지 cPage 로 저장
	    paging.setNowPage(cPage);
	    // 오프셋(페이지 블록당 넘어갈 페이지 수) = (limit * (현재 페이지-1))
	    // 예)	1페이지 : 5*(1-1)=0 즉 1페이지는 건너뛸 페이지 0개
	    //		2페이지 : 5*(2-1)=5 즉 2페이지는 건너뛸 페이지 5개
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    // 블록 계산
	    // 시작 블록 설정 ((현재페이지-1)/(한번에 담는 최대 블록수)) * (한번에 담는 최대 블록수) + 1
	    //					((1-1)/3)*3+1 = 1
	    paging.setBeginBlock(
	        (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    // 끝 블록 설정 (시작 블록 + 한번에 담는 최대 블록수 - 1) == ((1-1)/3)*3+1 = 1
	    //					
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }
	    
	    // sortOrder (최신순(newest), 인기순(popular))
	    String desc = "post_idx";
	    if(sortOrder.equals("newest")) {
	    	desc = "post_idx";
	    } else {
	    	desc = "post_views";
	    }
		map.put("list", rungroups);
	    map.put("paging", paging);
	    return map;
	}
	
	@RequestMapping("/mypage_ajax3")
	@ResponseBody
	public Map<String, Object> getscrapsGroup(HttpSession session,
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String sortOrder){
		Map<String, Object> map = new HashMap<>();
		UsersVO uvo = (UsersVO) session.getAttribute("uvo");
		String user_id = uvo.getUser_id();
		List<Integer> group_idx_list = mypageService.getScrapGroups(user_id);
		List<RunGroupsVO> rungroups = mypageService.getGroups(group_idx_list);
		int count = (rungroups != null) ? rungroups.size() : 0;
		count = rungroups.size();
		
		paging.setTotalRecord(count);
	    // 만약 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 적다면
	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	    	// 전체 페이지 수는 1개로 저장
	        paging.setTotalPage(1);
	    } else {
	    	// 불러온 게시글 수가 페이지당 최대 게시글 수(5개) 보다 크면
	    	// 전체 페이지 수 = (게시글 수/페이지 제한 수(5개)) + (나머지가 0보다 크면 1 아니면 0 더하기) == 14/5 + 1 = 3
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage() + 
	                            (paging.getTotalRecord() % paging.getNumPerPage() > 0 ? 1 : 0));
	    }
	    // 현재 페이지 cPage 로 저장
	    paging.setNowPage(cPage);
	    // 오프셋(페이지 블록당 넘어갈 페이지 수) = (limit * (현재 페이지-1))
	    // 예)	1페이지 : 5*(1-1)=0 즉 1페이지는 건너뛸 페이지 0개
	    //		2페이지 : 5*(2-1)=5 즉 2페이지는 건너뛸 페이지 5개
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    // 블록 계산
	    // 시작 블록 설정 ((현재페이지-1)/(한번에 담는 최대 블록수)) * (한번에 담는 최대 블록수) + 1
	    //					((1-1)/3)*3+1 = 1
	    paging.setBeginBlock(
	        (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    // 끝 블록 설정 (시작 블록 + 한번에 담는 최대 블록수 - 1) == ((1-1)/3)*3+1 = 1
	    //					
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }
	    
	    // sortOrder (최신순(newest), 인기순(popular))
	    String desc = "post_idx";
	    if(sortOrder.equals("newest")) {
	    	desc = "post_idx";
	    } else {
	    	desc = "post_views";
	    }
		map.put("list", rungroups);
	    map.put("paging", paging);
	    return map;
	}
	
	
}
