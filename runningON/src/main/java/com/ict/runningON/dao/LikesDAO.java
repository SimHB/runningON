package com.ict.runningON.dao;

import com.ict.runningON.vo.DislikesVO;
import com.ict.runningON.vo.LikesVO;

public interface LikesDAO {
	public int commentAddLike(LikesVO lvo);
	public int commentCheckLike(LikesVO lvo);
	public int commentDeleteLike(LikesVO lvo);
	public int commentCountLike(String comment_idx);
	public int postAddLike(LikesVO lvo);
	public int postCheckLike(LikesVO lvo);
	public int postDeleteLike(LikesVO lvo);
	public int postCountLike(String post_idx);
	public int postUpdateLike(String post_idx);
	public int postAddDislike(DislikesVO dlvo);
	public int postCheckDislike(DislikesVO dlvo);
	public int postDeleteDislike(DislikesVO dlvo);
	public int postCountDislike(String post_idx);
	public int postUpdateDislike(String post_idx);
	
}
