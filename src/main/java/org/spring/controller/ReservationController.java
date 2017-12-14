package org.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.ReservationVO;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {
private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Inject
	private ReservationService service;

	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reserve(HttpServletRequest request, Model model) throws Exception {
		logger.info("reserve(................");
		HttpSession session = request.getSession();
		Object uvo = session.getAttribute("login");
		String r_email=((UserVO)uvo).getU_email();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaa" + r_email);
		
		ReservationVO rvo = service.checkReservation(r_email);
		model.addAttribute("uvo", session.getAttribute("login"));
		
		if(rvo == null){
			return "reservation/reserve";
		} else {
			model.addAttribute("rvo", rvo);
			return "reservation/reserveError";
		}
		
	}
	
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(ReservationVO vo, Model model) throws Exception{
		logger.info("reservePOST(................" + vo);
		service.insertReservation(vo);
		model.addAttribute("rvo", vo);
		
		return "reservation/reserveCompl";
	}
}
