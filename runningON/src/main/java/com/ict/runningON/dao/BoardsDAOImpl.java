package com.ict.runningON.dao;

import org.springframework.stereotype.Repository;

@Repository
public class BoardsDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<BbsVO> getBbsList() {
		return sqlSessionTemplate.selectList("bbs.list");
	}

	@Override
	public int getBbsInsert(BbsVO bvo) {
		return sqlSessionTemplate.insert("bbs.insert", bvo);
	}

	@Override
	public BbsVO getBbsDetail(String b_idx) {
		return sqlSessionTemplate.selectOne("bbs.detail", b_idx);
	}

	@Override
	public int getBbsDelete(String b_idx) {
		return sqlSessionTemplate.update("bbs.delete", b_idx);
	}

	@Override
	public int getBbsUpdate(BbsVO bvo) {
		return sqlSessionTemplate.update("bbs.update", bvo);
	}

	@Override
	public int getHitUpdate(String b_idx) {
		return sqlSessionTemplate.update("bbs.hitupdate", b_idx);
	}

	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("bbs.count");
	}

	@Override
	public List<BbsVO> getBbsList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		
		return sqlSessionTemplate.selectList("bbs.pageList", map);
	}

	@Override
	public List<CommVO> getCommList(String b_idx) {
		return sqlSessionTemplate.selectList("bbs.clist", b_idx);
	}

	@Override
	public int getCommInsert(CommVO cvo) {
		return sqlSessionTemplate.insert("bbs.cinsert", cvo);
	}

	@Override
	public int getCommDelete(String c_idx) {
		return sqlSessionTemplate.delete("bbs.cdelete", c_idx);
	}
}