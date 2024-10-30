package com.ict.runningON.dao;

import java.util.List;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;

public interface BoardsDAO {
	// 리스트
    public List<PostsVO> getPostsList();
    
    // 삽입
    public int getPostsInsert(PostsVO pvo);
    
    // 상세보기
    public PostsVO getPostsDetail(String post_idx);
    
    // 원글 삭제
    public int getPostsDelete(String post_idx);
    
    // 원글 수정 
    public int getPostsUpdate(PostsVO pvo);
    
    // 조회수 업데이트
    public int getHitUpdate(String p_idx);
    // 페이징 처리 - 전체 게시물의 수
    public int getTotalCount();
    
    // 페이징 처리을 위한 리스트 
    public List<PostsVO> getPostsList(int offset, int limit);
    
    // 댓글 가져오기
    public List<CommentsVO> getCommList(String post_idx);
    // 댓글 삽입
    public int getCommInsert(CommentsVO cvo);
    // 댓글 삭제
    public int getCommDelete(String comment_idx);

}
