package org.spring.controller;

import java.util.Calendar;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.FAQVO;
import org.spring.domain.MenuVO;
import org.spring.domain.PageMaker;
import org.spring.domain.SearchCriteria;
import org.spring.domain.UserVO;
import org.spring.service.AdminService;
import org.spring.util.UploadFileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Inject
	private AdminService service;
	
	@Resource(name="uploadpath")
	private String uploadPath;
	
	@RequestMapping(value="/editFAQ", method = RequestMethod.POST)
	public String editFAQPOST(FAQVO vo, @ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("editFAQPOST(.............."+vo);
		service.editFAQ(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/listFAQ";
	}
	
	@RequestMapping(value = "/editFAQ", method = RequestMethod.GET)
	public void editFAQGET(@RequestParam("f_id") int f_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("editFAQGET(..............");
		model.addAttribute("vo", service.readFAQ(f_id));
	}
	
	@RequestMapping(value="/deleteFAQ", method = RequestMethod.POST)
	public String deleteFAQ(@RequestParam("f_id") int f_id, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("deleteFAQ(...................");
		
		service.deleteFAQ(f_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/listFAQ";
	}
	
	@RequestMapping(value = "/removeFAQs", method = RequestMethod.GET)
	public String removeFAQs(@RequestParam("cbArr") String[] cbArr,SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("removeFAQs(....................bno");
		service.removeFAQs(cbArr);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/listFAQ";
	}
	
	@RequestMapping(value="/postFAQ", method=RequestMethod.POST)
	public String postFAQPOST(FAQVO vo, @ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("postFAQPOST(.............." + vo);
		service.postFAQ(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/listFAQ";
	}
	
	@RequestMapping(value="/postFAQ", method=RequestMethod.GET)
	public void postFAQGET(@ModelAttribute("cri") SearchCriteria cri, Model model){
		logger.info("umregisterGET(............");
	}
	
	@RequestMapping(value = "/listFAQ", method = RequestMethod.GET)
	public void listFAQ(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("umlistPage(.....................");
		model.addAttribute("faqList", service.listFAQSearchCriteria(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listFAQCountSearchCriteria(cri));
		model.addAttribute("pmk", pmk);
	}
	

	@RequestMapping(value = "/removeReservations", method = RequestMethod.GET)
	public String removeReservations(@RequestParam("cbArr") String[] cbArr,SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("umremove(....................bno");
		service.removeReservations(cbArr);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/listReservation";
	}
	
	@RequestMapping(value="	/deleteReservation", method = RequestMethod.GET)
	public String deleteReservation(@RequestParam("r_id") int r_id, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("deleteReservation(...................");
		
		service.deleteReservation(r_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/listReservation";
	}
		
	@RequestMapping(value="/listReservation", method = RequestMethod.GET)
	public void listReservation(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("listReviews(...............");
		model.addAttribute("reservationList", service.listReservationSearchCriteria(cri));
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		String today = ""+cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DATE);
		int today_time = cal.get(Calendar.HOUR_OF_DAY)*60+cal.get(Calendar.MINUTE); 
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listReservationCountSearchCriteria(cri));
		model.addAttribute("pmk",pmk);
		model.addAttribute("date", today);
		model.addAttribute("time", today_time);
	}
	
	@RequestMapping(value="/deleteReply", method = RequestMethod.GET)
	public String deleteReply(@RequestParam("rno") int rno, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("deleteReply(...................");
		
		service.deleteReply(rno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/listReviews";
	}
	
	
	@RequestMapping(value = "/removeReplies", method = RequestMethod.GET)
	public String removeReplies(@RequestParam("cbArr") String[] cbArr, @RequestParam("delCount") int delCount, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("removeReplies(....................bno");
		service.removeReplies(cbArr, delCount);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/listReviews";
	}
	
	@RequestMapping(value="/listReviews", method = RequestMethod.GET)
	public void listReviews(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("listReviews(...............");
		model.addAttribute("reviewList", service.listReviewSearchCriteria(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listReviewCountSearchCriteria(cri));
		model.addAttribute("pmk",pmk);
	}
	
	@RequestMapping(value="/editMenu", method = RequestMethod.POST)
	public String editMenu(MultipartFile file, MenuVO mvo, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("editMenuPost(.............."+ mvo);
		
		MenuVO ex_mvo = service.readMenu(mvo.getM_id());
		
		String fileName = ex_mvo.getM_img().substring(38 + ex_mvo.getM_category().length() + 1);
		UploadFileUtils.removeFile(uploadPath, fileName, request, ex_mvo.getM_category());
		
		mvo.setM_hit(ex_mvo.getM_hit());
		
		String saveName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), request, mvo.getM_category());
		mvo.setM_img("http://jaesay.dothome.co.kr/springImg/" + mvo.getM_category() + "/" + saveName);
		service.editMenu(mvo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/listMenu";
	}
	
	@RequestMapping(value="/editMenu", method = RequestMethod.GET)
	public void editMenu(@RequestParam("m_id") int m_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("editMenu(...............");
		model.addAttribute("mvo", service.readMenu(m_id));
	}
	
	@RequestMapping(value="/deleteMenu", method = RequestMethod.POST)
	public String deleteMenu(@RequestParam("m_id") int m_id, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("deleteMenu(...................");
		
		MenuVO mvo = service.readMenu(m_id);
		String fileName = mvo.getM_img().substring(38 + mvo.getM_category().length() + 1);
		UploadFileUtils.removeFile(uploadPath, fileName, request, mvo.getM_category());
		service.deleteMenu(m_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/listMenu";
	}
	
	
	@RequestMapping(value="/readMenu", method = RequestMethod.GET)
	public void readMenu(@ModelAttribute("cri") SearchCriteria cri,Model model, @RequestParam("m_id") int m_id) throws Exception{
		logger.info("readMenu(................");
		model.addAttribute("mvo", service.readMenu(m_id));
	}
	
	@RequestMapping(value="/postMenu", method = RequestMethod.POST)
	public String postMenu(MultipartFile file, SearchCriteria cri, HttpServletRequest request, RedirectAttributes rttr, MenuVO mvo)throws Exception{
		logger.info("MenuVO : " + mvo);
		logger.info("orginalName : " + file.getOriginalFilename());
		logger.info("size : "+ file.getSize());
		logger.info("contentType : " + file.getContentType());
		/*
		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());*/
		String saveName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), request, mvo.getM_category());
		mvo.setM_img("http://jaesay.dothome.co.kr/springImg/" + mvo.getM_category() + "/" + saveName);
		service.postMenu(mvo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/admin/listMenu";
	}
	
	@RequestMapping(value="/postMenu", method=RequestMethod.GET)
	public void postMenu(@ModelAttribute("cri") SearchCriteria cri){
		logger.info("postMenu(.................");
	}
	
	@RequestMapping(value="/listMenu", method=RequestMethod.GET)
	public void listMenu(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("listMenu(...............");
		model.addAttribute("menuList", service.listMenuSearchCriteria(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.listMenuCountSearchCriteria(cri));
		model.addAttribute("pmk",pmk);
	}
	
	@RequestMapping(value="/umregister", method=RequestMethod.GET)
	public void umregisterGET(@ModelAttribute("cri") SearchCriteria cri, Model model){
		logger.info("umregisterGET(............");
	}
	
	@RequestMapping(value="/umregister", method=RequestMethod.POST)
	public String umregisterPOST(UserVO vo, @ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("umregisterPOST(..............");
		service.umregister(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/umlistPage";
	}
	
	@RequestMapping(value="/ummodify", method = RequestMethod.POST)
	public String ummodifyPOST(UserVO vo, @ModelAttribute("cri") SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		logger.info("ummodifyPOST(.............."+vo);
		service.ummodify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/umlistPage";
	}
	
	@RequestMapping(value = "/ummodify", method = RequestMethod.GET)
	public void ummodifyGET(@RequestParam("u_email") String u_email, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("ummodifyGET(..............");
		model.addAttribute("vo", service.umread(u_email));
	}
	
	@RequestMapping(value="/deleteUser", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("u_email") String u_email, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		logger.info("deleteUser(...................");
		
		service.deleteUser(u_email);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/umlistPage";
	}
	
	@RequestMapping(value = "/umremove", method = RequestMethod.GET)
	public String umremove(@RequestParam("cbArr") String[] cbArr,SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("umremove(....................bno");
		service.umremove(cbArr);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/umlistPage";
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String startAdmin(Model model) throws Exception {
		logger.info("startAdmin(................");
		
		return "admin/adminPage";
	}
	
	@RequestMapping(value="/umlistAll", method = RequestMethod.GET)
	public void umlistAll(Model model) throws Exception{
		logger.info("umlistAll(................");
		model.addAttribute("userList", service.umlistAll());
	}
	
	@RequestMapping(value = "/umlistPage", method = RequestMethod.GET)
	public void umlistPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("umlistPage(.....................");
		model.addAttribute("userList", service.umlistSearchCriteria(cri));
		PageMaker pmk = new PageMaker();
		pmk.setCri(cri);
		pmk.setTotalCount(service.umlistCountSearchCriteria(cri));
		model.addAttribute("pmk", pmk);
	}
	
}
