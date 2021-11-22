package com.kh.animall.users.styboard.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.users.member.model.vo.Member;
import com.kh.animall.users.styboard.model.dao.StyBoardDAO;
import com.kh.animall.users.styboard.model.vo.StyBoard;
import com.kh.animall.users.styboard.model.vo.StyBoardImg;

@Service
public class StyBoardServiceImpl implements StyBoardService {

	@Autowired
	StyBoardDAO styBoardDAO;

	// 보여지는 게시글 갯수
	private final int unitSize = 8;

	// 게시글 작성
	@Override
	public Map<String, Object> insert(StyBoard styboard, List<MultipartFile> file, HttpServletRequest req,
			HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		List<StyBoardImg> styBoardImgList = new ArrayList<StyBoardImg>();

		Member member = (Member) session.getAttribute("member");

		styboard.setStyno(styBoardDAO.getStynoByMno(member.getMno()));

		// 게시글
		styBoardDAO.insertStyBoard(styboard);

		// 이미지
		String imgPath = "/resources/styboardUpload";
		String saveDirectory = req.getServletContext().getRealPath(imgPath);

		int idx = 0;
		for (MultipartFile f : file) {

			if (!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);

				StyBoardImg sbi = new StyBoardImg();
				sbi.setBno(styboard.getBno());
				sbi.setStyno(styboard.getStyno());
				sbi.setOriginname(originName);
				sbi.setChangename(changeName);
				sbi.setImgpath(imgPath + "/" + changeName);
				sbi.setImglevel(idx);
				styBoardImgList.add(sbi);
				idx++;

				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		styBoardDAO.insertStyBoardImg(styBoardImgList);

		resultData.put("ok", true);

		return resultData;
	}

	// 단순 파일 이름 변경용 메소드
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int) (Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;

	}

	@Override
	public List<StyBoard> getList(int index, String searchKeyword, HttpSession session) {
		Map<String, Object> page = new HashMap<>();
		int startIndex = (index - 1) * unitSize + 1;
		int endIndex = index * unitSize;

		page.put("startIndex", startIndex);
		page.put("endIndex", endIndex);
		page.put("searchKeyword", searchKeyword);

		Member member = (Member) session.getAttribute("member");
		page.put("mno", member.getMno());

		return styBoardDAO.getList(page);
	}

	// 상세 보기
	@Override
	public Map<String, Object> getDetail(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Member member = (Member) session.getAttribute("member");

		StyBoard styboard = styBoardDAO.getOneBoard(bno);
		// StyBoard styboard = styBoardDAO.getInfo(mno);

		boolean showBtn = false;
		if (member.getMno() == styboard.getMno() || (member.getMtype()).equals("ADMIN")) {// 본인의 글이거나, 관리자일경우
			showBtn = true;
		}

		styboard.setBcontent(xssShield(styboard.getBcontent()));
		List<StyBoardImg> styBoardImgList = styBoardDAO.getImgList(bno);
		
		Map<String, Object> likeData = new HashMap<>();
		likeData.put("bno", bno);
		likeData.put("mno", member.getMno());

		resultData.put("countLike", styBoardDAO.countLike(bno));
		resultData.put("like", styBoardDAO.checkLike(likeData));
		resultData.put("styBoard", styboard);
		resultData.put("styBoardImgList", styBoardImgList);
		resultData.put("showBtn", showBtn);

		return resultData;
	}

	// 좋아요
	public Map<String, Object> slike(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Member member = (Member) session.getAttribute("member");

		Map<String, Object> likeData = new HashMap<>();
		likeData.put("bno", bno);
		likeData.put("mno", member.getMno());

		int checkResult = styBoardDAO.checkLike(likeData);

		if (checkResult > 0) {
			styBoardDAO.deleteLike(likeData);
			resultData.put("ok", false);
		} else {
			styBoardDAO.insertLike(likeData);
			resultData.put("ok", true);
		}

		resultData.put("countLike", styBoardDAO.countLike(bno));
		return resultData;
	}

	// 자바 스크립트 공격 방어
	public String xssShield(String str) {

		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll("\'", "&apos;");
		str = str.replaceAll(" ", "&nbsp;");
		str = str.replaceAll("\n", "<br>");

		return str;
	}

	// 글쓰기 정보 가져오기
	@Override
	public Map<String, Object> getInfo(HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();

		Member member = (Member) session.getAttribute("member");

		Map<String, Object> info = styBoardDAO.getInfo(member.getMno());

		if (info == null) {
			resultData.put("ok", false);
		} else {
			resultData.put("ok", true);
			resultData.put("info", info);
		}

		return resultData;
	}

	@Override
	public Map<String, Object> delete(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();

		Member member = (Member) session.getAttribute("member");

		StyBoard b = styBoardDAO.getOneBoard(bno);

		if (b.getMno() == member.getMno() || (member.getMtype()).equals("ADMIN")) {
			styBoardDAO.delete(bno);
			styBoardDAO.deleteBoardImg(bno);
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}
		return resultData;
	}

	@Override
	public Map<String, Object> getUpdateForm(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		StyBoard styboard = styBoardDAO.getOneBoard(bno);
		resultData.put("styBoard", styboard);
		return resultData;
	}

	@Override
	public Map<String, Object> update(StyBoard styboard, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();

		Member member = (Member) session.getAttribute("member");

		StyBoard b = styBoardDAO.getOneBoard(styboard.getBno());

		if (b.getMno() == member.getMno()) {
			styBoardDAO.update(styboard);
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}
		return resultData;
	}

}
