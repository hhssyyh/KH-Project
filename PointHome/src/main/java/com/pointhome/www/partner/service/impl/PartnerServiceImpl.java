package com.pointhome.www.partner.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pointhome.www.partner.dao.face.PartnerDao;
import com.pointhome.www.partner.dto.Partner;
import com.pointhome.www.partner.service.face.PartnerService;

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

}
