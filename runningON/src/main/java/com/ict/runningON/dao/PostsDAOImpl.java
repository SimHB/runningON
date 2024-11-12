package com.ict.runningON.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.runningON.vo.CommentsVO;
import com.ict.runningON.vo.PostsVO;
import com.ict.runningON.vo.ReportVO;
import com.ict.runningON.vo.ScrapsVO;

@Repository
public class PostsDAOImpl implements PostsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int getPostsInsert(PostsVO pvo) {
		return sqlSessionTemplate.insert("posts.insert", pvo);
	}
	@Override
	public int getPostsViewUpdate(String post_idx) {
		return sqlSessionTemplate.update("posts.viewupdate", post_idx); 
	}
	@Override
	public PostsVO getPostsDetail(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.detail", post_idx);
	}
	@Override
	public List<CommentsVO> getCommentList(String post_idx) {
		return sqlSessionTemplate.selectList("posts.clist",post_idx);
	}
	@Override
	public int getCommentInsert(CommentsVO cvo) {
		return sqlSessionTemplate.insert("posts.cinsert",cvo);
	}
	@Override
	public int getCommentDelete(String comment_idx) {
		return sqlSessionTemplate.delete("posts.cdelete",comment_idx);
	}
	@Override
	public int insertScrapPost(ScrapsVO svo) {
		return sqlSessionTemplate.insert("posts.insertScrap", svo);
	}
	@Override
	public int checkScrapPost(ScrapsVO svo) {
		return sqlSessionTemplate.selectOne("posts.checkScrap", svo);
	}
	@Override
	public int deleteScrapPost(ScrapsVO svo) {
		return sqlSessionTemplate.delete("posts.deleteScrap", svo);
	}
	@Override
	public int reportPost(ReportVO rvo) {
		return sqlSessionTemplate.insert("posts.reportPost", rvo);
	}
	@Override
	public int checkReportPost(ReportVO rvo) {
		return sqlSessionTemplate.selectOne("posts.checkReportPost", rvo);
	}
	@Override
	public int countReportPost(String post_idx) {
		return sqlSessionTemplate.selectOne("posts.countReportPost", post_idx);
	}
	@Override
	public int updateReportPost(String post_idx) {
		return sqlSessionTemplate.update("posts.updateReportPost", post_idx);
	}
	@Override
	public int reportComment(ReportVO rvo) {
		return sqlSessionTemplate.insert("posts.reportComment", rvo);
	}
	@Override
	public int checkReportComment(ReportVO rvo) {
		return sqlSessionTemplate.selectOne("posts.checkReportComment", rvo);
	}
	@Override
	public int updateReportComment(String comment_idx) {
		return sqlSessionTemplate.update("posts.updateReportComment", comment_idx);
	}
	@Override
	public int getPostsUpdate(PostsVO pvo) {
		return sqlSessionTemplate.update("posts.update", pvo);
	}
	@Override
	public int getPostsDelete(String post_idx) {
		return sqlSessionTemplate.update("posts.delete", post_idx);
	}
}

