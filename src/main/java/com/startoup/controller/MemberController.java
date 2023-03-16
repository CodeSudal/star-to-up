package com.startoup.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.startoup.biz.list.ListServiceImpl;
import com.startoup.biz.list.ListVO;
import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.member.MyFundingVO;
import com.startoup.biz.member.MyLikeVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberSI;

	@Autowired
	private ProductServiceImpl productSI;

	@Autowired
	private ListServiceImpl listSI;

	@RequestMapping(value = "/myPage.do")
	public String selectOneMember() {

		return "myPage.jsp";
	}

	// 약관 동의
	@RequestMapping(value = "/agreement.do")
	public String agreement() {
		return "agreement.jsp";
	}

	// Id 중복 체크
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public @ResponseBody String checkId(@RequestBody MemberVO vo) {

		vo = memberSI.selectOneMember(vo);
		if (vo == null) {
			return "success";
		} else {
			return "duplicate";
		}
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkEmail.do", method = RequestMethod.POST)
	public String checkEmail(MemberVO vo) {

		vo = memberSI.selectOneEmail(vo);
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
	public String selectOneMember(MemberVO vo, MyLikeVO mlvo, Model model, String msg, String lo, HttpSession session) {
		vo = memberSI.loginMember(vo);
		System.out.println("login : " + vo);

		if (vo == null) { // 로그인 실패

			// alert.jsp
			msg = "loginFalse";
			model.addAttribute("msg", msg);
			return "alert.jsp";

		} else { // 로그인 성공 하면
			mlvo.setMlMid(vo.getmId()); // 아이디 mlvo에 저장
			vo.setmLikecnt(memberSI.countLike(mlvo).getMlNum());// likecnt 쿼리문 돌려서 저장
			session.setAttribute("member", vo); // 세션에 정보 저장 "member"라는 이름으로

			return "redirect:store.do";
		}
	}

	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin.do")
	public String kakaoMember(MemberVO vo, MyLikeVO mlvo,HttpSession session) {

		// 처음 카카오로그인한 계정이라면, 회원가입
		if (memberSI.selectKakaoMember(vo) == null) {
			memberSI.insertKakaoMember(vo);
		}
		vo = memberSI.selectKakaoMember(vo);
		mlvo.setMlMid(vo.getmId()); // 아이디 mlvo에 저장
		vo.setmLikecnt(memberSI.countLike(mlvo).getMlNum());// likecnt 쿼리문 돌려서 저장
		session.setAttribute("member", vo); // 세션에 정보 저장 "member"라는 이름으로
		return "redirect:store.do";
	}

	// 로그아웃 했을 때
	@RequestMapping(value = "/logout.do")
	public String logoutMember(HttpSession session, String msg,String lo, Model model) {
		System.out.println("logoutMember() 입장");

		session.removeAttribute("mylike");
		session.removeAttribute("member"); // 세션 특정 정보만 비우기

		msg = "logout";
		lo = "main.do";
		model.addAttribute("msg", msg);
		model.addAttribute("lo", lo);
		return "alert.jsp";
	}

	// 회원가입 화면
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinView() {
		return "join.jsp";
	}

	// 회원가입 버튼 클릭 시
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, String msg, String lo, Model model) {
		System.out.println("insertMember() 입장");

		if (!memberSI.insertMember(vo)) {
			msg = "joinFalse";
			model.addAttribute("msg", msg);
		} else {
			msg = "joinTrue";
			lo = "login.do";
			model.addAttribute("msg", msg);
		}
		return "alert.jsp";
	}

	// 회원 탈퇴 페이지로
	@RequestMapping(value = "/withdrowal.do")
	public String withdrowalView() {
		return "withdrowal.jsp";
	}

	// 카카오 회원 탈퇴 페이지로
	@RequestMapping(value = "/withdrowal2.do")
	public String withdrowal2View() { // kakao withdrowal
		return "withdrowal2.jsp";
	}

	// 회원탈퇴 버튼 누름
	@RequestMapping(value = "/deleteMember.do")
	public String deletemember(MemberVO vo, HttpSession session, String msg, String lo, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setmId(member.getmId());
		if (!memberSI.deleteMember(vo)) {
			msg = "withdrowalFalse";
			model.addAttribute("msg", msg);
		} else {
			msg = "withdrowalTrue";
			lo = "main.do";
			model.addAttribute("msg", msg);
			model.addAttribute("lo", lo);
			session.removeAttribute("member");
		}
		return "alert.jsp";
	}

	// 회원탈퇴 - 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "/pwChk.do")
	public String pwChk(MemberVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		vo.setmPw(vo.getmPw());

		if (member.getmPw().equals(vo.getmPw())) {
			return "true";
		} else {
			return "0";
		}
	}

	// 상품디테일 페이지 들어갔을 때 찜 여부 확인하기위함.
	@RequestMapping(value = "/detail.do")
	public String selcetOneBoard(ProductVO pvo, HttpSession session, MyLikeVO myvo, ListVO lvo, Model model) {

		lvo.setlPid(pvo.getpNum()); // Pid 넘겨주기

		// 로그인 되어 있으면 -> 멤버아이디,제품번호로 찜되어있는지 여부 파악해서
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) {
			myvo.setMlPid(pvo.getpNum());
			myvo.setMlMid(member.getmId());

		}
		// isMylike : 찜 여부 파악 용도 -> 찜 안 되어 있으면 null / 찜 되어 있으면 MylikeVO 리턴해줌.
		// 현재 찜목록 하나 보는거 없어서 추가되면 할 예정!!
		model.addAttribute("list", listSI.selectCount(lvo)); // 찜 인원
		model.addAttribute("isMylike", memberSI.checkLike(myvo));
		model.addAttribute("data", productSI.selectOne(pvo));

		return "detail.jsp";
	}

	// 찜목록
	@RequestMapping(value = "/shopcart.do")
	public String selectAllList(@ModelAttribute("i") MyLikeVO mlvo, Model model, HttpSession session) {

		// 로그인 되어 있으면 -> 멤버아이디,제품번호로 찜되어있는지 여부 파악해서
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) { // 로그인 했으면
			mlvo.setMlMid(member.getmId()); // 세션에 저장되어있는 아이디 mlvo에 저장
		} else {
			return "login.jsp"; // 로그인 하세요 메세지 띄우기
		}
		if (memberSI.myLikeList(mlvo).isEmpty()) {
			return "noProduct.jsp";
		}
		model.addAttribute("datas", memberSI.myLikeList(mlvo));

		return "shopcart.jsp";

	}

	// 찜목록 - 삭제
	@RequestMapping(value = "/shopcartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteLikeList(@RequestBody List<Integer> list, String msg, Model model, MyLikeVO mlvo,
			HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		mlvo.setMlMid(mvo.getmId());
		memberSI.deleteLikeList(list, mlvo);
		mvo.setmLikecnt(memberSI.countLike(mlvo).getMlNum());// likecnt 쿼리문 돌려서 저장
		session.setAttribute("member", mvo); // 세션에 정보 저장 "member"라는 이름으로

		return "true";
	}

	// 찜하기
	@RequestMapping(value = "/heart.do", method = RequestMethod.POST)
	public @ResponseBody String heart(@RequestBody MyLikeVO mlvo, HttpSession session) {
		System.out.println("heartBoard 입장");

		if (memberSI.insertLike(mlvo)) { // 찜하기 성공
			MemberVO vo = (MemberVO) session.getAttribute("member");
			mlvo.setMlMid(vo.getmId());
			vo.setmLikecnt(memberSI.countLike(mlvo).getMlNum());// likecnt 쿼리문 돌려서 저장
			session.setAttribute("member", vo); // 세션에 정보 저장 "member"라는 이름으로
			return "success";
		} else {
			return "fail";
		}

	}

	// 찜취소
	@RequestMapping(value = "/heartNo.do", method = RequestMethod.POST)
	public @ResponseBody String heartNo(@RequestBody MyLikeVO mlvo, HttpSession session) {

		if (memberSI.deleteLike(mlvo)) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			mlvo.setMlMid(vo.getmId());
			vo.setmLikecnt(memberSI.countLike(mlvo).getMlNum());// likecnt 쿼리문 돌려서 저장
			session.setAttribute("member", vo); // 세션에 정보 저장 "member"라는 이름으로
			return "success";
		} else {
			System.out.println("삭제안됨");
			return "0";
		}
	}

	// 내 펀딩 내역 보기
	@RequestMapping(value = "/myFundingList.do")
	public String myFundingList(MyFundingVO vo, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member != null) {
			vo.setMfMid(member.getmId());
		} else {
			return "login.jsp"; // 로그인 하세요 메세지 띄우기
		}
		if (memberSI.myFundList(vo).isEmpty()) {
			return "noProduct.jsp";
		}
		model.addAttribute("datas", memberSI.myFundList(vo));

		return "orderList.jsp";
	}

}