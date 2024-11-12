package com.ict.runningON.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.LikesDAO;
import com.ict.runningON.vo.DislikesVO;
import com.ict.runningON.vo.LikesVO;

@Service
public class LikesServiceImpl implements LikesService{
	@Autowired
	public LikesDAO likesDAO;
	
	@Override
	public int commentAddLike(LikesVO lvo) {
		return likesDAO.commentAddLike(lvo);
	}

	@Override
	public int commentCountLike(String comment_idx) {
		return likesDAO.commentCountLike(comment_idx);
	}

	@Override
	public int commentCheckLike(LikesVO lvo) {
		return likesDAO.commentCheckLike(lvo);
	}

	@Override
	public int commentDeleteLike(LikesVO lvo) {
		return likesDAO.commentDeleteLike(lvo);
	}

	@Override
	public int postAddLike(LikesVO lvo) {
		return likesDAO.postAddLike(lvo);
	}

	@Override
	public int postCheckLike(LikesVO lvo) {
		return likesDAO.postCheckLike(lvo);
	}

	@Override
	public int postDeleteLike(LikesVO lvo) {
		return likesDAO.postDeleteLike(lvo);
	}

	@Override
	public int postCountLike(String post_idx) {
		return likesDAO.postCountLike(post_idx);
	}

	@Override
	public int postUpdateLike(String post_idx) {
		return likesDAO.postUpdateLike(post_idx);
	}

	@Override
	public int postAddDislike(DislikesVO dlvo) {
		return likesDAO.postAddDislike(dlvo);
	}

	@Override
	public int postCheckDislike(DislikesVO dlvo) {
		return likesDAO.postCheckDislike(dlvo);
	}

	@Override
	public int postDeleteDislike(DislikesVO dlvo) {
		return likesDAO.postDeleteDislike(dlvo);
	}

	@Override
	public int postCountDislike(String post_idx) {
		return likesDAO.postCountDislike(post_idx);
	}

	@Override
	public int postUpdateDislike(String post_idx) {
		return likesDAO.postUpdateDislike(post_idx);
	}

}
