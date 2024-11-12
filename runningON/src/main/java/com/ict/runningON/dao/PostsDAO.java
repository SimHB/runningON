package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.ReportVO;
import com.ict.runningON.vo.ScrapsVO;

public interface PostsDAO {
	public int getPostsInsert(PostsVO pvo);
	
	public int getPostsViewUpdate(String post_idx);
	
	public PostsVO getPostsDetail(String post_idx);
	// 댓글 가져오기
	public List<CommentsVO> getCommentList(String post_idx);
	// 댓글 삽입
	public int getCommentInsert(CommentsVO cvo);
	// 댓글 삭제
	public int getCommentDelete(String comment_idx);
	// 게시글 스크랩
	public int insertScrapPost(ScrapsVO svo);
	public int checkScrapPost(ScrapsVO svo);
	public int deleteScrapPost(ScrapsVO svo);
	// 게시글 신고
	public int reportPost(ReportVO rvo);
	// 신고 중복체크
	public int checkReportPost(ReportVO rvo);
	// 게시글 누적 신고 수 
	public int countReportPost(String post_idx);
	// 게시글 누적 신고수 업데이트
	public int updateReportPost(String post_idx);
	// 댓글 신고
	public int reportComment(ReportVO rvo);
	// 댓글 중복체크
	public int checkReportComment(ReportVO rvo);
	// 댓글 누적 신고수 업데이트
	public int updateReportComment(String comment_idx);
	// 게시글 업데이트
	public int getPostsUpdate(PostsVO pvo);
	// 게시글 삭제
	public int getPostsDelete(String post_idx);
}
