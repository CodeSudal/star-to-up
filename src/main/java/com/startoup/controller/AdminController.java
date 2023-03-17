package com.startoup.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.startoup.biz.list.ListServiceImpl;
import com.startoup.biz.list.ListVO;
import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller // @Controller + @ResponseBody
public class AdminController {

	@Autowired
	private MemberServiceImpl memberSI;
	@Autowired
	private ProductServiceImpl ProductSI;
	@Autowired
	private ListServiceImpl listSI;

	@RequestMapping(value = "/adminFunding.do")
	public String selectAllFund(ProductVO pvo, Model model) {

		model.addAttribute("fundingList", ProductSI.selectAll(pvo));
		return "adminFundingManagement.jsp";
	}

	// 메일 요청 페이지로 이동 // 기존 방식
	/*
	 * @RequestMapping(value="/sendEmail.do") public String sendEmail(ProductVO pvo,
	 * Model model) { System.out.println("sendEmailController 입장");
	 * 
	 * 
	 * model.addAttribute("fundingList", ProductSI.selectAll(pvo)); return
	 * "sendAllMail.jsp"; }
	 */

	// 두번째 시도
	// VO가 아닌 DTO의 개념을 많이 쓰지만 하나의 메서드에서만 사용되어 편의상 VO 사용
	/*
	 * @GetMapping("/sendAllMail.do") public ListVO sendEmail(@RequestParam("name")
	 * String name,
	 * 
	 * @RequestParam("pName") String pName,
	 * 
	 * @RequestParam("email") String email, ListVO vo, Model model) {
	 * 
	 * model.addAttribute("datas", ListSI.selectAllProduct(vo)); return vo; //return
	 * new ListVO(name, pName, email); }
	 */
	@ResponseBody
	@RequestMapping("/sendEmailQR.co")
	public String sendEmailQR(Gson gson, ListVO vo) {

		/*
		 * Gson gson = new Gson(); String json = gson.toJson(myObject); MyObject
		 * myObject2 = gson.fromJson(json, MyObject.class);
		 */
		JsonObject obj = new JsonObject();

		listSI.selectAllList(vo);
		obj.addProperty("name", vo.getlMid());// id
		obj.addProperty("pName", vo.getLpName()); //pName
		obj.addProperty("email", vo.getlEmail()); //Email
		

		//JsonObject data = new JsonObject();
		//data.addProperty("time", "12:00");
		//obj.add("data", data);

		return obj.toString();
	}

	@RequestMapping(value = "/adminProduct.do")
	public String selectAllProduct(ProductVO pvo, Model model) {

		model.addAttribute("datas", ProductSI.selectAll(pvo));
		return "adminProductManagement.jsp";
	}

	@RequestMapping(value = "/adminProductInsert.do")
	public String selectAllProductInsert(ProductVO pvo, Model model, String msg, String lo,
			MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = pvo.getUploadFile();
		System.out.println("src value : " + pvo.getUploadFile());

		// MultipartFile에 업로드 파일이 들어왔는지 확인
		if (!fileList.isEmpty()) {
			System.out.println("이미지 업로드 확인");
		}

		// 파일을 저장할 내 경로
		String path = "C:\\jiwon1108\\workspace2\\startoup\\src\\main\\webapp\\img\\";

		// forEach문을 돌면서 순차적으로 이미지를 저장하기 위한 변수 i
		int i = 0;

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			if (originFileName.isBlank()) {
				break;
			}

			// 첫번째 이미지는 setpIamge1에 저장
			if (i == 0) {
				pvo.setpImage1(originFileName);
			}
			// 두번째 이미지
			else if (i == 1) {
				pvo.setpImage2(originFileName);
			}
			// 세번째 이미지
			else if (i == 2) {
				pvo.setpImage3(originFileName);
			}

			// 파일 업로드 경로 + 파일 이름
			String safeFile = path + originFileName;

			// 다음 이미지 저장으로 가기 위한 i++
			i++;
			try {
				// 해당 경로에 파일 저장
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		boolean insert = ProductSI.insertProduct(pvo);
		if (!insert) {
			msg = "insertImageFalse";
			model.addAttribute("msg", msg);
		} else {
			msg = "insertImageTrue";
			lo = "adminProduct.do";
			model.addAttribute("msg", msg);
			model.addAttribute("lo", lo);
		}
		return "alert.jsp";
	}

	@RequestMapping(value = "/adminMember.do")
	public String selectAllMember(MemberVO mvo, Model model) {

		model.addAttribute("memberList", memberSI.selectAllMember(mvo));
		return "adminMemberManagement.jsp";
	}

	@RequestMapping(value = "/adminMemberDelete.do")
	public String deleteMember(MemberVO mvo, Model model) {

		model.addAttribute("memberList", memberSI.deleteMember(mvo));
		return "redirect:adminMember.do";
	}

}