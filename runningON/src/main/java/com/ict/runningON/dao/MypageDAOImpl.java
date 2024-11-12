package com.ict.runningON.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.MessagesVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.RunGroupsVO;
import com.ict.runningON.vo.ScrapsVO;
import com.ict.runningON.vo.UsersVO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MessagesVO> getSendMsgList(String user_id) {
		return sqlSessionTemplate.selectList("mypage.sendlist", user_id);
	}
	
	@Override
	public List<MessagesVO> getReceiveMsgList(String user_id) {
		return sqlSessionTemplate.selectList("mypage.receivelist", user_id);
	}

	@Override
	public int getSendMsg(MessagesVO mvo) {
		return sqlSessionTemplate.insert("mypage.sendmsg", mvo);
	}

	@Override
	public MessagesVO getOneMsg(String msg_idx) {
		return sqlSessionTemplate.selectOne("mypage.one", msg_idx);
	}

	@Override
	public UsersVO getMyInfo(String user_id) {
		return sqlSessionTemplate.selectOne("mypage.info", user_id);
	}

	@Override
	public int updateInfo(UsersVO uvo) {
		//System.out.println("dao:" + uvo.getUser_profileImg());
		return sqlSessionTemplate.update("mypage.info_update", uvo);
	}

	@Override
	public List<PostsVO> getPostList(String user_id) {
		return sqlSessionTemplate.selectList("mypage.write_list", user_id);
	}

	@Override
	public List<CommentsVO> getMyComments(String user_id) {
		return sqlSessionTemplate.selectList("mypage.get_comments", user_id);
	}

	@Override
	public List<PostsVO> getPostList(List<Integer> post_idx) {
		return sqlSessionTemplate.selectList("mypage.get_com_posts", post_idx);
	}

	@Override
	public List<ScrapsVO> getMyScraps(String user_id) {
		return sqlSessionTemplate.selectList("mypage.get_scraps", user_id);
	}

	@Override
	public List<RunGroupsVO> getCreateGroup(String user_id) {
		return sqlSessionTemplate.selectList("mypage.get_create_group", user_id);
	}

	@Override
	public List<Integer> getJoinGroups(String user_id) {
		return sqlSessionTemplate.selectList("mypage.get_join_groups", user_id);
	}

	@Override
	public int deletePost(List<Integer> post_idx) {
		return sqlSessionTemplate.update("mypage.delete_post", post_idx);
	}

	@Override
	public int deleteComment(List<Integer> comment_idx) {
		return sqlSessionTemplate.delete("mypage.delete_comment", comment_idx);
	}

	@Override
	public int deleteScrap(String user_id, List<Integer> post_idx) {
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("post_idx", post_idx);
		return sqlSessionTemplate.delete("mypage.delete_scrap", map);
	}

	@Override
	public List<RunGroupsVO> getGroups(List<Integer> group_idx) {
		return sqlSessionTemplate.selectList("mypage.get_groups", group_idx);
	}

	@Override
	public List<Integer> getScrapGroups(String user_id) {
		return sqlSessionTemplate.selectList("mypage.get_scrap_groups", user_id);
	}

	@Override
	public void readMsg(String msg_idx) {
		sqlSessionTemplate.update("mypage.read_msg", msg_idx);
	}

	@Override
	public int getMsgNum(String user_id) {
		return sqlSessionTemplate.selectOne("mypage.count_msg", user_id);
	}

}
