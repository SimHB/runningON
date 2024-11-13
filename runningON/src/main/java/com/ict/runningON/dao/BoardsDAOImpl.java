package com.ict.runningON.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 게시판 이름 불러오기
	@Override
	public BoardsVO getBoardInfo(String board_idx) {
		return sqlSessionTemplate.selectOne("boards.b_info",board_idx);
	}
	// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
	@Override
	public List<PostsVO> getPostsList() {
		return sqlSessionTemplate.selectList("boards.p_list");
	}
	// 페이징 처리 - 전체 게시글의 수
	@Override
	public int getTotalCount(String board_idx) {
		return sqlSessionTemplate.selectOne("boards.count", board_idx);
	}
	// 페이징 처리을 위한 리스트(러닝그룹을 제외한 게시글)
	@Override
	public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc) {
		Map<String, Object> map = new HashMap<>();
		map.put("limit", limit);
		map.put("offset", offset);
		map.put("board_idx", board_idx);
		map.put("desc", desc);
		
		return sqlSessionTemplate.selectList("boards.pageList", map);
	}
	// 페이징 처리을 위한 리스트(러닝그룹)
	@Override
	public List<RunGroupsVO> getRunGroupsList(int offset, int limit, String board_idx, String desc) {
		Map<String, Object> map = new HashMap<>();
		map.put("limit", limit);
		map.put("offset", offset);
		map.put("board_idx", board_idx);
		map.put("desc", desc);
		
		return sqlSessionTemplate.selectList("boards.groupPageList", map);
	}
	// 페이징 처리을 위한 리스트(Hot 게시글)
		@Override
		public List<PostsVO> getHotPostsList(int offset, int limit, String desc) {
			Map<String, Object> map = new HashMap<>();
			map.put("limit", limit);
			map.put("offset", offset);
			map.put("desc", desc);
			
			return sqlSessionTemplate.selectList("boards.hotPageList", map);
	}
}