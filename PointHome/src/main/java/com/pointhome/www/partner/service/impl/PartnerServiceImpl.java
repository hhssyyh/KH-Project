package com.pointhome.www.partner.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.partner.dao.face.PartnerDao;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.service.face.PartnerService;
import com.pointhome.www.util.Paging;

@Service
public class PartnerServiceImpl implements PartnerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PartnerDao partnerDao;
	
	@Override
	public void join(Partner partner) {
		
		
		 int res = partnerDao.selectCntByEmailPhone(partner);
		 if(res>0) {
			 logger.debug("아이디 or 번호 중복");
		 } else {
			 logger.debug("중복아님");
			 partnerDao.insertPartner(partner);
		 }
		
			
	}

	@Override
	public Boolean isLogin(Partner partner) {
		
		int res = partnerDao.selectCntByPartnerEmailPw(partner);
		
		if(res>0) {
			logger.debug("회원정보 존재 : {}", res);
			return true;
		}else {
			
			return false;
		}
	}

	@Override
	public Partner getPartner(Partner partner) {
		
		Partner param = new Partner();
		param = partnerDao.selectByPartnerEmailPw(partner);
		logger.debug("partner{}",param);
		
		return param;
	}

	@Override
	public Paging getPaging(int curPage) {
		int totalPage = partnerDao.selectCntAll();
		
		logger.info("total: {}", totalPage);
		
		Paging paging = new Paging(totalPage, curPage);
		
		return paging;
	}

	@Override
	public List<Partner> list(Paging paging) {
		
		List<Partner> list = partnerDao.selectAll(paging);
		
		logger.info("service!!!!!!!!!!!!!!!!{}", list);
		
		return list;
	}

	@Override
	public Paging getTypePaging(Map<String, Object> pagingMap) {
		
		logger.info("맵 !!!!!!!!!!!!!!!!{}", pagingMap.get("partnerType"));
		logger.info("맵 !!!!!!!!!!!!!!!!{}", pagingMap.get("curPage"));
		
		int totalPage = partnerDao.selectCntTypeAll(pagingMap);
		
		logger.info("total: {}", totalPage);
		
		Paging paging = new Paging(totalPage, (int) pagingMap.get("curPage"));
		
		return paging;
	}

	@Override
	public List<Partner> typelist(Map<String, Object> listMap) {
		
		logger.info("리스트 !!!!!!!!!!!!!!!!{}", listMap.get("partnerType"));
		logger.info("리스트 !!!!!!!!!!!!!!!!{}", listMap.get("paging"));
		
		List<Partner> list = partnerDao.selectTypeListAll(listMap);
		
		logger.info("service!!!!!!!!!!!!!!!!{}", list);
		
		return list;
	}



}
