package org.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.Criteria;
import org.spring.domain.PageMaker;
import org.spring.domain.ReplyVO;
import org.spring.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		logger.info("register(..................vo >>>"+vo.toString());
		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("register", e.getStackTrace());
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{m_id}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("m_id") Integer m_id,
			@PathVariable("page") Integer page){
		logger.info("listPage(................m_id,page >>>"+m_id+","+page);
		ResponseEntity<Map<String, Object>> entity = null;
			try {
				Criteria cri = new Criteria();
				cri.setPage(page);
				PageMaker pmk = new PageMaker();
				pmk.setCri(cri);
				Map<String, Object> map = new HashMap<String, Object>();
				List<ReplyVO> list = service.listReplyPage(m_id, cri);
				map.put("list", list);
				int replyCount = service.count(m_id);
				pmk.setTotalCount(replyCount);
				map.put("pmk", pmk);
				Double reviewScore = service.getReviewScore(m_id);
				map.put("reviewScore", reviewScore);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("listPage", e.getStackTrace());				
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}			
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno,
			@RequestBody ReplyVO vo){
		logger.info("update(..................rno,vo >>>"+rno+vo.toString());
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("update", e.getStackTrace());
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		logger.info("remove(..................rno,vo >>>"+rno);
		ResponseEntity<String> entity = null;
		try {			
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("remove", e.getStackTrace());
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/all/{m_id}",method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("m_id") Integer m_id){
		logger.info("list(................m_id >>>"+m_id);
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(service.listReply(m_id),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("list", e.getStackTrace());
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
