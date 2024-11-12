package com.ict.runningON.service;

import java.util.List;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.ReportVO;
import com.ict.runningON.vo.ScrapsVO;

public interface PostsService {
	// 게시글 작성
	public int getPostsInsert(PostsVO pvo);
	// 게시글 조회수 
	public int getPostsViewUpdate(String post_idx);
	// 게시글 내용
	public PostsVO getPostsDetail(String post_idx);
	// 댓글 가져오기
	public List<CommentsVO> getCommentList(String post_idx);
	// 댓글 삽입
	public int getCommentInsert(CommentsVO cvo);
	// 댓글 삭제
	public int getCommentDelete(String comment_idx);
	// 게시글 스크랩
	public int insertScrapPost(ScrapsVO svo);
	// 게시글 중복 스크랩 체크
	public int checkScrapPost(ScrapsVO svo);
	// 게시글 스크랩 삭제
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
