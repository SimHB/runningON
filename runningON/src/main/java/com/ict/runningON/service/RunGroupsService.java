package com.ict.runningON.service;

import java.util.List;

import com.ict.runningON.vo.Group_joinVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;

public interface RunGroupsService {
	
	// 그룹 가입하기 하면 group_join DB에 등록
	public int GroupJoinInsert(Group_joinVO gjvo);
	
	// 공지 보기
	public PostsVO noti(String group_idx);
	
	// 모임 정보 상세 보기
	public RunGroupsVO getgvo(String group_idx);
	
	// 모임 수다 게시판
	public List<PostsVO> getpvo(String group_idx);
	
	// 모임 가입자
	public List<String> getgmem(String group_idx);
	
	// 게시판 이름 불러오기
	public RunGroupsVO getBoardName(String group_idx);
	
	// 리스트 : 게시판에 불러올 게시글들을 담은 리스트
    public List<RunGroupsVO> getGroupsList();
    
    // 삽입 : 게시글 작성 시 DB에 삽입
    public int getGroupsInsert(RunGroupsVO gvo);
    
    // 삽입 : 모임 수다 게시글 작성 시 DB에 삽입
    public int getGroupPostInsert(PostsVO pvo);
    
    // 상세보기 : 게시글 내용 불러오기
    public RunGroupsVO getGroupsDetail(String group_idx);
    
    // 원글 삭제 : 게시글 삭제
    public int getGroupsDelete(String group_idx);
    
    // 원글 수정 : 게시글 수정
    public int getGroupPostUpdate(PostsVO pvo);
    
    // 원글 수정 : 모임글 수정
    public int getGroupsUpdate(RunGroupsVO gvo);
    
	/*
	 * // 조회수 업데이트 : 게시글 들어갈 때 조회수 증가(계정당 하루에 한번) 
	 * public int getHitUpdate(String p_idx);
	 */
    
    // 페이징 처리 - 전체 게시물의 수
    public int getTotalCount(String group_idx);
    
    // 페이징 처리을 위한 리스트
    //public List<PostsVO> getPostsList(int offset, int limit);
    public List<RunGroupsVO> getGroupsList(int offset, int limit, String group_idx, String desc);

    // 댓글 가져오기
    // public List<CommentsVO> getCommList(String post_idx);
    // 댓글 삽입
    // public int getCommInsert(CommentsVO cvo);
    // 댓글 삭제
    // public int getCommDelete(String comment_idx);
}