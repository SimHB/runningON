package com.ict.runningON.service;

import org.springframework.stereotype.Service;

@Service
public class BoardsServiceImpl {
	@Autowired
	private BbsDAO bbsDAO; 
	
	@Override
	public List<BbsVO> getBbsList() {
		return bbsDAO.getBbsList();
	}

	@Override
	public int getBbsInsert(BbsVO bvo) {
		return bbsDAO.getBbsInsert(bvo);
	}

	@Override
	public BbsVO getBbsDetail(String b_idx) {
		return bbsDAO.getBbsDetail(b_idx);
	}

	@Override
	public int getBbsDelete(String b_idx) {
		return bbsDAO.getBbsDelete(b_idx);
	}

	@Override
	public int getBbsUpdate(BbsVO bvo) {
		return bbsDAO.getBbsUpdate(bvo);
	}

	@Override
	public int getHitUpdate(String b_idx) {
		return bbsDAO.getHitUpdate(b_idx);
	}

	@Override
	public int getTotalCount() {
		return bbsDAO.getTotalCount();
	}

	@Override
	public List<BbsVO> getBbsList(int offset, int limit) {
		return bbsDAO.getBbsList(offset, limit);
	}

	@Override
	public List<CommVO> getCommList(String b_idx) {
		return bbsDAO.getCommList(b_idx);
	}

	@Override
	public int getCommInsert(CommVO cvo) {
		return bbsDAO.getCommInsert(cvo);
	}

	@Override
	public int getCommDelete(String c_idx) {
		return bbsDAO.getCommDelete(c_idx);
	}
}