package org.spring.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Inject
	private UserService service;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto, HttpServletRequest request){
		logger.info("loginGET(............dto >>>" + dto.toString());
		if(request.getSession().getAttribute("destination") == null){
			request.getSession().setAttribute("destination", request.getParameter("go"));
		}
	}
	
	
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		logger.info("loginPOST(..................vo >>>" + dto.toString());
		
		UserVO uvo = service.login(dto);
		if(uvo==null){
			return;
		}
		model.addAttribute("uvo", uvo);
		if(dto.isUseCookie()){
			int timeLimit = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis()+(timeLimit*1000));
			service.keepLogin(uvo.getU_email(), session.getId(), sessionLimit);
		}
	}
	
	
	@RequestMapping(value="/adminError", method=RequestMethod.GET)
	public void checkError(){
		logger.info("checkError(..................");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkLogin", method=RequestMethod.GET)
	public void checkLogin(){
		logger.info("checkLoginGET(...............");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkLogin", method=RequestMethod.POST)
	public ResponseEntity<String> checkLogin(@RequestBody UserVO vo) throws Exception {
		logger.info("checkLoginPOST(...............");
		ResponseEntity<String> entity = null;
		String msg=null;
		try {
			boolean result = service.checkLogin(vo);
			if(result){
				msg="SUCCESS";
			}else{
				msg="FAIL";
			}
			entity = new ResponseEntity<String>(msg,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/deleteReservation", method=RequestMethod.GET)
	public String deleteReservation(@RequestParam("r_email") String r_email, RedirectAttributes rttr) throws Exception{
		logger.info("deleteReservation(.............");
		service.deleteReservation(r_email);
		
		return "redirect:/user/myReservation?r_email="+r_email;
	}
	
	@RequestMapping(value="/myReservation", method=RequestMethod.GET)
	public void readMyReservation(Model model,@RequestParam("r_email") String r_email) throws Exception{
		logger.info("readMyReservation(................");
		model.addAttribute("rvo", service.getMyReservation(r_email));
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String edit(Model model, UserVO vo) throws Exception{
		logger.info("edit(.............."+ vo);
		UserVO uvo = service.getUserInfo(vo);
		model.addAttribute("uvo", uvo);
		return "/user/edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editPost(UserVO vo) throws Exception{
		logger.info("editPost(................");
		service.editInfo(vo);
		
		return "/user/editCompl";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPwd", method=RequestMethod.GET)
	public void checkPwd(){
		logger.info("checkPwdGET(.............");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPwd", method=RequestMethod.POST)
	public ResponseEntity<String> checkPwd(@RequestBody UserVO vo) throws Exception{
		logger.info("checkPwdPOST(..............." +  vo);
		ResponseEntity<String> entity = null;
		String msg=null;
		try {
			boolean result = service.checkPwd(vo);
			if(result){
				msg="SUCCESS";
			}else{
				msg="FAIL";
			}
			entity = new ResponseEntity<String>(msg,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteId", method=RequestMethod.POST)
	public String deleteId(UserVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("deleteId(..............");
		service.deleteId(vo);
		
		Object status = session.getAttribute("login");
		
		if(status != null){
			UserVO uvo = (UserVO)status;
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			if(cookie != null){
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				service.keepLogin(uvo.getU_email(), session.getId(), new Date());
			}
		}
		
		return "/user/deleteIdCompl";
	}
	
	@RequestMapping(value="/deleteAuth", method=RequestMethod.GET)
	public void deleteAuth(){
		logger.info("deleteAuth(...............");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public void checkId(){
		logger.info("checkId(...............");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestBody UserVO vo) throws Exception {
		logger.info("checkId(...............");
		ResponseEntity<String> entity = null;
		String msg=null;
		try {
			boolean result = service.checkId(vo);
			if(result){
				msg="SUCCESS";
			}else{
				msg="FAIL";
			}
			entity = new ResponseEntity<String>(msg,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET(Model model, HttpServletRequest request){
		logger.info("registerGET(............");
		HttpSession session = request.getSession();
		if(session.getAttribute("login") != null){
			return "/";
		}
		return "/user/register";
	}
	

	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public void registerPOST(LoginDTO dto, UserVO vo, RedirectAttributes rttr, HttpServletRequest request, Model model) throws Exception{
		logger.info("registerPOST(..................vo >>>" + vo.toString());
		request.getSession().setAttribute("destination", request.getParameter("go"));
		
		service.signUp(vo);
		UserVO uvo = service.login(dto);
		
		model.addAttribute("uvo", uvo);
		if(uvo==null){
			return;
		}
		model.addAttribute("uvo", uvo);
	}

	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception{
		Object status = session.getAttribute("login");
		
		if(status != null){
			UserVO uvo = (UserVO)status;
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			if(cookie != null){
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				service.keepLogin(uvo.getU_email(), session.getId(), new Date());
			}
			rttr.addFlashAttribute("msg", "success");
		}
		
		return "redirect:/";
	}
	@RequestMapping(value="/registerCompl", method=RequestMethod.GET)
	public String registerCompl(Model model) throws Exception {
		logger.info("registerCompl(................");
		
		return "/user/registerCompl";
	}
}
