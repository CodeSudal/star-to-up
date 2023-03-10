package com.startoup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.member.MyLikeVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberSI;

	@Autowired
	private ProductServiceImpl productSI;

	@RequestMapping(value = "/myPage.do")
	public String selectOneMember() {

		return "myPage.jsp";
	}

	@RequestMapping(value = "/myList.do")
	public String selectAllList() {

		return "myList.jsp";
	}

	@RequestMapping(value = "/agreement.do")
	public String agreement() {

		return "agreement.jsp";
	}

	// 로그인 페이지로 처음 이동할 때
	@RequestMapping(value = "/check.do", method = RequestMethod.POST)
	public @ResponseBody String check(@RequestBody MemberVO vo) {

		vo = memberSI.selectOneMember(vo);
		if (vo == null) {
			return "success";
		} else {
			return "duplicate";
		}

	}

	// 로그인 페이지로 처음 이동할 때
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(@ModelAttribute("member") MemberVO vo) {

		return "login.jsp";
	}

	// 로그인 했을 때
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String selectOneMember(MemberVO vo, HttpSession session) {
		System.out.println("selectOneMember() 입장");
		vo = memberSI.loginMember(vo);
		System.out.println("vo : " + vo);

		if (vo == null) { // 로그인 실패
			return "redirect:login.do"; // 다시 로그인 페이지
		} else { // 로그인 성공 하면
			session.setAttribute("member", vo); // 세션에 정보 저장 "member"라는 이름으로
			return "redirect:store.do";
		}
	}

	// 로그아웃 했을 때
	@RequestMapping(value = "/logout.do")
	public String logoutMember(HttpSession session) {
		System.out.println("logoutMember() 입장");

		session.removeAttribute("member"); // 세션 특정 정보만 비우기

		return "redirect:login.do";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinView() {

		return "join.jsp";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo) {
//		System.out.println("insertMember() 입장");

//		memberSI.insertMember(vo);

		return "redirect:login.do";
	}

	// 상품디테일 페이지 들어갔을 때 찜 여부 확인하기위함.
	@RequestMapping(value = "/detail.do")
	public String selcetOneBoard(ProductVO pvo, HttpSession session, MyLikeVO myvo, Model model) {

		// 로그인 되어 있으면 -> 멤버아이디,제품번호로 찜되어있는지 여부 파악해서
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) {
			myvo.setMlPid(pvo.getpNum());
			myvo.setMlMid(member.getmId());

		}
		// isMylike : 찜 여부 파악 용도 -> 찜 안 되어 있으면 null / 찜 되어 있으면 MylikeVO 리턴해줌.
		// 현재 찜목록 하나 보는거 없어서 추가되면 할 예정!!
		
		model.addAttribute("isMylike", memberSI.checkList(myvo));
//		model.addAttribute("isMylike", memberSI.selectOneList(myvo);
		model.addAttribute("data", productSI.selectOne(pvo));

		return "detail.jsp";
	}

	// 찜하기
	@RequestMapping(value = "/heart.do", method = RequestMethod.POST)
	public @ResponseBody String heart(@RequestBody MyLikeVO vo) {
		System.out.println("heartBoard 입장");

		System.out.println("vo:" + vo);

		if (memberSI.insertList(vo)) {
			System.out.println("저장됨");
			return "success";
		} else {
			System.out.println("저장안됨");
			return "fail";
		}

	}

	// 찜취소
	@RequestMapping(value = "/heartNo.do", method = RequestMethod.POST)
	public @ResponseBody String heartNo(@RequestBody MyLikeVO vo) {
		System.out.println("heartNoBoard 입장");

		System.out.println("vo:" + vo);

		if (memberSI.deleteList(vo)) {
			System.out.println("삭제됨");
			return "success";
		} else {
			System.out.println("삭제안됨");
			return "s";
		}

	}

}