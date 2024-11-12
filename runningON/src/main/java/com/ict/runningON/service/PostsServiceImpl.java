package com.ict.runningON.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.runningON.dao.PostsDAO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.ReportVO;
import com.ict.runningON.vo.ScrapsVO;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired
	public PostsDAO postsDAO;
	
	@Override
	public int getPostsInsert(PostsVO pvo) {
		return postsDAO.getPostsInsert(pvo);
	}

	@Override
	public int getPostsViewUpdate(String post_idx) {
		return postsDAO.getPostsViewUpdate(post_idx);
	}

	@Override
	public PostsVO getPostsDetail(String post_idx) {
		return postsDAO.getPostsDetail(post_idx);
	}

	@Override
	public List<CommentsVO> getCommentList(String post_idx) {
		return postsDAO.getCommentList(post_idx);
	}

	@Override
	public int getCommentInsert(CommentsVO cvo) {
		return postsDAO.getCommentInsert(cvo);
	}

	@Override
	public int getCommentDelete(String comment_idx) {
		return postsDAO.getCommentDelete(comment_idx);
	}

	@Override
	public int insertScrapPost(ScrapsVO svo) {
		return postsDAO.insertScrapPost(svo);
	}

	@Override
	public int checkScrapPost(ScrapsVO svo) {
		return postsDAO.checkScrapPost(svo);
	}

	@Override
	public int deleteScrapPost(ScrapsVO svo) {
		return postsDAO.deleteScrapPost(svo);
	}

	@Override
	public int reportPost(ReportVO rvo) {
		return postsDAO.reportPost(rvo);
	}

	@Override
	public int checkReportPost(ReportVO rvo) {
		return postsDAO.checkReportPost(rvo);
	}

	@Override
	public int countReportPost(String post_idx) {
		return postsDAO.countReportPost(post_idx);
	}

	@Override
	public int updateReportPost(String post_idx) {
		return postsDAO.updateReportPost(post_idx);
	}

	@Override
	public int reportComment(ReportVO rvo) {
		return postsDAO.reportComment(rvo);
	}

	@Override
	public int checkReportComment(ReportVO rvo) {
		return postsDAO.checkReportComment(rvo);
	}

	@Override
	public int updateReportComment(String comment_idx) {
		return postsDAO.updateReportComment(comment_idx);
	}

	@Override
	public int getPostsUpdate(PostsVO pvo) {
		return postsDAO.getPostsUpdate(pvo);
	}

	@Override
	public int getPostsDelete(String post_idx) {
		return postsDAO.getPostsDelete(post_idx);
	}
	
}
