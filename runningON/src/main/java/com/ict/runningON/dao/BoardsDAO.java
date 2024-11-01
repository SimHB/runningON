package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.BoardsVO;
import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;

public interface BoardsDAO {
	// 게시판 이름 불러오기
	public BoardsVO getBoardName(String board_idx);
	
	// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
    public List<PostsVO> getPostsList();
    
    // 삽입 : 게시글 작성 시 DB에 삽입
    public int getPostsInsert(PostsVO pvo);
    
    // 상세보기 : 게시글 내용 불러오기
    public PostsVO getPostsDetail(String post_idx);
    
    // 원글 삭제 : 게시글 삭제
    public int getPostsDelete(String post_idx);
    
    // 원글 수정 : 게시글 수정
    public int getPostsUpdate(PostsVO pvo);
    
    // 조회수 업데이트 : 게시글 들어갈 때 조회수 증가(계정당 하루에 한번)
    public int getHitUpdate(String p_idx);
    
    // 페이징 처리 - 전체 게시물의 수
    public int getTotalCount(String board_idx);
    
    // 페이징 처리을 위한 리스트 
    //public List<PostsVO> getPostsList(int offset, int limit);
    public List<PostsVO> getPostsList(int offset, int limit, String board_idx, String desc);
    
    // 댓글 가져오기
    public List<CommentsVO> getCommList(String post_idx);
    // 댓글 삽입
    public int getCommInsert(CommentsVO cvo);
    // 댓글 삭제
    public int getCommDelete(String comment_idx);
}