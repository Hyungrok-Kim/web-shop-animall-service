package com.kh.animall.users.board.model.service;

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

import com.kh.animall.users.board.model.dao.BoardDAO;
import com.kh.animall.users.board.model.vo.Board;
import com.kh.animall.users.board.model.vo.BoardImg;
import com.kh.animall.users.board.model.vo.BoardReply;
import com.kh.animall.users.member.model.vo.Member;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	// 보여지는 게시글 갯수
	private final int unitSize = 8;

	// 게시글 작성
	@Override
	public Map<String, Object> insert(Board board, List<MultipartFile> file, HttpServletRequest req,
			HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		List<BoardImg> boardImgList = new ArrayList<BoardImg>();

		// 로그인사용자 정보 가져오기
		Member member = (Member) session.getAttribute("member");

		board.setMno(member.getMno());

		// 게시글삽입
		boardDAO.insertBoard(board);

		// 이미지업로드
		String imgPath = "/resources/boardUpload";
		String saveDirectory = req.getServletContext().getRealPath(imgPath);

		int idx = 0;
		for (MultipartFile f : file) {

			if (!f.isEmpty()) {
				String originName = f.getOriginalFilename();// 원본파일명
				String changeName = fileNameChanger(originName);// 저장될파일명

				BoardImg bi = new BoardImg();
				bi.setBno(board.getBno());
				bi.setMno(member.getMno());
				bi.setOriginname(originName);
				bi.setChangename(changeName);
				bi.setImgpath(imgPath + "/" + changeName);
				bi.setImglevel(idx);
				boardImgList.add(bi);
				idx++;

				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		// 이미지DB저장
		boardDAO.insertBoardImg(boardImgList);

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
	public List<Board> getList(int index, HttpSession session) {
		Map<String, Object> page = new HashMap<>();
		int startIndex = (index - 1) * unitSize + 1;
		int endIndex = index * unitSize;

		page.put("startIndex", startIndex);
		page.put("endIndex", endIndex);
		
		Member member = (Member) session.getAttribute("member");
		page.put("mno", member.getMno());

		return boardDAO.getList(page);
	}

	// 상세 보기
	@Override
	public Map<String, Object> getDetail(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Member member = (Member) session.getAttribute("member");
		resultData.put("loginMno", member.getMno()); // 로그인한 Mno
		
		Board board = boardDAO.getOneBoard(bno); //게시글 정보 가져오기
		board.setBcontent(xssShield(board.getBcontent())); //게시글 xss방어
		
		List<BoardImg> boardImgList = boardDAO.getImgList(bno);//이미지 리스트
		List<BoardReply> replyList = boardDAO.getReplyList(bno);//댓글 리스트

		for (BoardReply boardReply : replyList) {
			boardReply.setRcontent(xssShield(boardReply.getRcontent()));
		}
		
		Map<String, Object> likeData = new HashMap<>();
		likeData.put("bno", bno);
		likeData.put("mno", member.getMno());
			
		resultData.put("countLike", boardDAO.countLike(bno));
		resultData.put("like", boardDAO.checkLike(likeData) > 0);
		resultData.put("board", board);
		resultData.put("boardImgList", boardImgList);
		resultData.put("replyList", replyList);
		resultData.put("isAdmin", member.getMtype().equals("ADMIN")); //로그인한 사람이 admin이라면 true
		
		return resultData;
	}

	// 댓글 달기
	@Override
	public Map<String, Object> insertReply(BoardReply boardReply, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Member member = (Member) session.getAttribute("member");
		resultData.put("isAdmin", member.getMtype().equals("ADMIN")); //로그인한 사람이 admin이라면 true
		resultData.put("loginMno", member.getMno()); // 로그인한 Mno
		
		boardReply.setMno(member.getMno());//작성 하려는 댓글 글쓴이 로그인한 사람 mno로 set

		int result = boardDAO.insertReply(boardReply);

		if (result > 0) {
			List<BoardReply> replyList = boardDAO.getReplyList(boardReply.getBno());
			for (BoardReply br : replyList) {
				br.setRcontent(xssShield(br.getRcontent()));
			}
			resultData.put("replyList", replyList);
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}

		return resultData;
	}

	// 좋아요
	@Override
	public Map<String, Object> blike(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Member member = (Member) session.getAttribute("member");

		Map<String, Object> likeData = new HashMap<>();
		likeData.put("bno", bno);
		likeData.put("mno", member.getMno());	

		int checkResult = boardDAO.checkLike(likeData);

		if (checkResult > 0) {// 좋아요 이미 있음
			boardDAO.deleteLike(likeData);
			resultData.put("ok", false);
		} else {// 좋아요 없음
			boardDAO.insertLike(likeData);
			resultData.put("ok", true);
		}

		resultData.put("countLike", boardDAO.countLike(bno));

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

	@Override
	public Map<String, Object> getUpdateForm(int bno, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();
		Board board = boardDAO.getOneBoard(bno);
		resultData.put("board", board);
		return resultData;
	}

	
	@Override
	public Map<String, Object> update(Board board, HttpSession session) {
		Map<String, Object> resultData = new HashMap<>();

		Member member = (Member) session.getAttribute("member");

		Board b = boardDAO.getOneBoard(board.getBno());

		if (b.getMno() == member.getMno()) {
			boardDAO.update(board);
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}

		return resultData;
	}

	// 게시글 삭제
	@Override
	public Map<String, Object> delete(int bno, HttpSession session) {

		Map<String, Object> resultData = new HashMap<>();

		Member member = (Member) session.getAttribute("member");

		Board b = boardDAO.getOneBoard(bno);

		if (b.getMno() == member.getMno() || (member.getMtype()).equals("ADMIN")) {
			boardDAO.delete(bno);
			boardDAO.deleteBoardImg(bno);
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}

		return resultData;
	}

	// 댓글 삭제
	@Override
	public Map<String, Object> replyDelete(int rno, HttpSession session) {
		
		Map<String, Object> resultData = new HashMap<>();
		
		Member member = (Member) session.getAttribute("member");
		resultData.put("isAdmin", member.getMtype().equals("ADMIN")); //로그인한 사람이 admin이라면 true
		resultData.put("loginMno", member.getMno()); // 로그인한 Mno

		BoardReply r = boardDAO.getOneReply(rno);
		
		if(r == null) {
			resultData.put("ok", false);
			return resultData;
		}

		if (r.getMno() == member.getMno() || (member.getMtype()).equals("ADMIN")) {
			boardDAO.replyDelete(rno);
			
			List<BoardReply> replyList = boardDAO.getReplyList(r.getBno());
			for (BoardReply br : replyList) {
				br.setRcontent(xssShield(br.getRcontent()));
			}
			resultData.put("replyList", replyList);
			
			resultData.put("ok", true);
		} else {
			resultData.put("ok", false);
		}
		
		return resultData;
	}

}







