package com.ict.runningON.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.runningON.service.BoardsService;
import com.ict.runningON.vo.PostsVO;

@RestController
public class BoardsAjaxController {
	
	/* 심현보 */
	@Autowired
	private BoardsService boardsService;
	
	@Autowired
	private Paging paging;
	
	@RequestMapping("/posts_ajax")
	@ResponseBody
	public Map<String, Object> getPostListAjax(@RequestParam(defaultValue = "1") int cPage,
											@RequestParam String board_idx) {
	    Map<String, Object> map = new HashMap<>();

	    // 1. 전체 게시물 수 가져오기 및 페이징 설정
	    int count = boardsService.getTotalCount(board_idx);
	    paging.setTotalRecord(count);

	    if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	        paging.setTotalPage(1);
	    } else {
	        paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage() + 
	                            (paging.getTotalRecord() % paging.getNumPerPage() > 0 ? 1 : 0));
	    }

	    paging.setNowPage(cPage);
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    // 블록 계산
	    paging.setBeginBlock(
	        (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    if (paging.getEndBlock() > paging.getTotalPage()) {
	        paging.setEndBlock(paging.getTotalPage());
	    }

	    // DB에서 데이터 가져오기
	    List<PostsVO> list = boardsService.getPostsList(board_idx, paging.getOffset(), paging.getNumPerPage());

	    map.put("list", list);
	    map.put("paging", paging);
	    return map;
	}
}