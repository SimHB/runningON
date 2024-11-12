package com.ict.runningON.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.DislikesVO;
import com.ict.runningON.vo.LikesVO;

@Repository
public class LikesDAOImpl implements LikesDAO{
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int commentAddLike(LikesVO lvo) {
		return sqlSessionTemplate.insert("posts.insertClike", lvo);
	}

	@Override
	public int commentCountLike(String comment_idx) {
		return sqlSessionTemplate.selectOne("posts.countClike",comment_idx);
	}

	@Override
	public int commentCheckLike(LikesVO lvo) {
		return sqlSessionTemplate.selectOne("posts.checkClike", lvo);
	}

	@Override
	public int commentDeleteLike(LikesVO lvo) {
		return sqlSessionTemplate.delete("posts.deleteClike",lvo);
	}

	@Override
	public int postAddLike(LikesVO lvo) {
		return sqlSessionTemplate.insert("posts.insertPlike", lvo);
	}

	@Override
	public int postCheckLike(LikesVO lvo) {
		return sqlSessionTemplate.selectOne("posts.checkPlike", lvo);
	}

	@Override
	public int postDeleteLike(LikesVO lvo) {
		return sqlSessionTemplate.delete("posts.deletePlike",lvo);
	}

	@Override
	public int postCountLike(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.countPlike",post_idx);
	}

	@Override
	public int postUpdateLike(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.updatePlike", post_idx);
	}

	@Override
	public int postAddDislike(DislikesVO dlvo) {
		return sqlSessionTemplate.insert("posts.insertPdislike", dlvo);
	}

	@Override
	public int postCheckDislike(DislikesVO dlvo) {
		return sqlSessionTemplate.selectOne("posts.checkPdislike", dlvo);
	}

	@Override
	public int postDeleteDislike(DislikesVO dlvo) {
		return sqlSessionTemplate.delete("posts.deletePdislike",dlvo);
	}

	@Override
	public int postCountDislike(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.countPdislike", post_idx);
	}

	@Override
	public int postUpdateDislike(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.updatePdislike", post_idx);
	}
	

}
