package com.ict.runningON.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public BoardsVO getBoardName(String board_idx) {
		return sqlSessionTemplate.selectOne("boards.b_list",board_idx);
	}
	
	@Override
	public List<PostsVO> getPostsList() {
		return sqlSessionTemplate.selectList("boards.p_list");
	}

	@Override
	public int getPostsInsert(PostsVO pvo) {
		return sqlSessionTemplate.insert("boards.insert", pvo);
	}

	@Override
	public PostsVO getPostsDetail(String post_idx) {
		return sqlSessionTemplate.selectOne("boards.detail", post_idx);
	}

	@Override
	public int getPostsDelete(String post_idx) {
		return sqlSessionTemplate.update("boards.delete", post_idx);
	}

	@Override
	public int getPostsUpdate(PostsVO pvo) {
		return sqlSessionTemplate.update("boards.update", pvo);
	}

	@Override
	public int getHitUpdate(String post_idx) {
		return sqlSessionTemplate.update("boards.viewsupdate", post_idx);
	}

	@Override
	public int getTotalCount(String board_idx) {
		return sqlSessionTemplate.selectOne("boards.count", board_idx);
	}

//	@Override
//	public List<PostsVO> getPostsList(int offset, int limit) {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("offset", offset);
//		map.put("limit", limit);
//		
//		return sqlSessionTemplate.selectList("boards.pageList", map);
//	}
	@Override
	public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc) {
		System.out.println(desc);
		Map<String, Object> map = new HashMap<>();
		map.put("limit", limit);
		map.put("offset", offset);
		map.put("board_idx", board_idx);
		map.put("desc", desc);
		
		return sqlSessionTemplate.selectList("boards.pageList", map);
	}

	@Override
	public List<CommentsVO> getCommList(String post_idx) {
		return sqlSessionTemplate.selectList("boards.clist", post_idx);
	}

	@Override
	public int getCommInsert(CommentsVO cvo) {
		return sqlSessionTemplate.insert("boards.cinsert", cvo);
	}

	@Override
	public int getCommDelete(String comment_idx) {
		return sqlSessionTemplate.delete("boards.cdelete", comment_idx);
	}
}