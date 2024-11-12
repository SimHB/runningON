package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.PostsVO;

public interface RunGroupsDAO {
	// 모임 정보 상세 보기
		public RunGroupsVO getrungroupsselect(String group_idx);
		// group정보 post에 넣기
		public int insert_g_post(RunGroupsVO gvo);
		
		// 게시판 이름 불러오기
		public RunGroupsVO getBoardName(String group_idx);
		
		// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
	    public List<RunGroupsVO> getGroupsList();
	    
	    // 삽입 : 게시글 작성 시 DB에 삽입
	    public int getGroupsInsert(RunGroupsVO gvo);
	    
	    // 상세보기 : 게시글 내용 불러오기
	    public RunGroupsVO getGroupsDetail(String group_idx);
	    
	    // 원글 삭제 : 게시글 삭제
	    public int getGroupsDelete(String group_idx);
	    
	    // 원글 수정 : 게시글 수정
	    public int getGroupPostUpdate(RunGroupsVO gvo);
	    
	    // 원글 수정 : 모임글 수정
	    public int getGroupsUpdate(RunGroupsVO gvo);
	    
		/*
		 * // 조회수 업데이트 : 게시글 들어갈 때 조회수 증가(계정당 하루에 한번) 
		 * public int getHitUpdate(String p_idx);
		 */
	    
	    // 페이징 처리 - 전체 게시물의 수
	    public int getTotalCount(String group_idx);
	    
	    // 페이징 처리을 위한 리스트
	    //public List<RunGroupsVO> getPostsList(int offset, int limit);
	    public List<RunGroupsVO> getGroupsList(int offset, int limit, String group_idx, String desc);
	    
	    // 댓글 가져오기
	    // public List<CommentsVO> getCommList(String group_idx);
	    // 댓글 삽입
	    // public int getCommInsert(CommentsVO cvo);
	    // 댓글 삭제
	    // public int getCommDelete(String comment_idx);

}
