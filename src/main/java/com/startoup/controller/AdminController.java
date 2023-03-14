package com.startoup.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.startoup.biz.member.MemberServiceImpl;
import com.startoup.biz.member.MemberVO;
import com.startoup.biz.product.ProductServiceImpl;
import com.startoup.biz.product.ProductVO;

@Controller
public class AdminController {

	@Autowired
	private MemberServiceImpl memberSI;
	@Autowired
	private ProductServiceImpl ProductSI;

	@RequestMapping(value="/adminFunding.do")
	public String selectAllFund(ProductVO pvo, Model model) {

		model.addAttribute("fundingList", ProductSI.selectAll(pvo));
		return "adminFundingManagement.jsp";
	}

	@RequestMapping(value="/adminProduct.do")
	public String selectAllProduct(ProductVO pvo, Model model) {

		model.addAttribute("datas", ProductSI.selectAll(pvo));
		return "adminProductManagement.jsp";
	}

	@RequestMapping(value="/adminProductInsert.do")
	public String selectAllProductInsert(ProductVO pvo, Model model, MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = pvo.getUploadFile();
		System.out.println("src value : " + pvo.getUploadFile());
		
		// MultipartFile에 업로드 파일이 들어왔는지 확인
		if (!fileList.isEmpty()) {
			System.out.println("이미지 업로드 확인");
		}
		
		// 파일을 저장할 내 경로
		String path = "/Users/ljh0323/Desktop/Program/Eclipse/eclipseFile/LEE1108/workspace02/startoup/src/main/webapp/img/";
		
		// forEach문을 돌면서 순차적으로 이미지를 저장하기 위한 변수 i
		int i=0;

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			
			// 첫번째 이미지는 setpIamge1에 저장
			if(i==0) {
				pvo.setpImage1(originFileName);
			}
			// 두번째 이미지
			else if(i==1) {
				pvo.setpImage2(originFileName);
			}
			// 세번째 이미지
			else if(i==2) {
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

		System.out.println("adminProductInsert 들어옴");
		// INSERT PRODUCT
		model.addAttribute("datas", ProductSI.insertProduct(pvo));
		System.out.println("adminProductInsert 나감");
		return "adminProduct.do";
	}

	@RequestMapping(value="/adminMember.do")
	public String selectAllMember(MemberVO mvo, Model model) {

		model.addAttribute("memberList", memberSI.selectAllMember(mvo));
		return "adminMemberManagement.jsp";
	}

	@RequestMapping(value="/adminMemberDelete.do")
	public String deleteMember(MemberVO mvo, Model model) {

		model.addAttribute("memberList", memberSI.deleteMember(mvo));
		return "redirect:adminMember.do";
	}

}