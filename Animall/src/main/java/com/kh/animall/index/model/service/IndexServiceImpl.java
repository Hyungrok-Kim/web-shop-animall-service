package com.kh.animall.index.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.animall.common.exception.ProductException;
import com.kh.animall.index.model.dao.IndexDAO;
import com.kh.animall.index.model.vo.IndexProduct;
import com.kh.animall.index.model.vo.ProductImages;


@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	IndexDAO indexDAO;

	@Override
	public List<IndexProduct> selectProductList() {
		
		return indexDAO.selectProductList();
	}
	
	@Override
	public List<IndexProduct> recSelectProductList() {
		
		return indexDAO.recSelectProductList();
	}

	@Override
	public List<IndexProduct> eventSelectProductList() {
		
		return indexDAO.eventSelectProductList();
	}

	@Override
	public List<IndexProduct> instaSelectProductList() {
		
		return indexDAO.instaSelectProductList();
	}
	

	@Override
	public int insertProduct(IndexProduct indexProduct, MultipartFile[] upFiles , HttpServletRequest req) {
		
		// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
				// HttpServletRequest가 GenericServlet을 상속하고 getServletContext는 GenericServlet의 메소드
				// getServletContext(return Servletcontext) : 서블릿 엔진 정보를 포함한 Servletcontext 객체를 얻는다
				// getRealPath(return String) : ServletContext 인터페이스의 메소드로, 주어진 디렉토리의 실제경로를 얻는다
				String saveDirectory = req.getServletContext().getRealPath("/resources/boardUpload");
				String imgpath = saveDirectory + "/";
				
				List<ProductImages> attachList = new ArrayList<>();
				
				// MultipartFile이 list형태
				for(MultipartFile f : upFiles) {
					if( f.isEmpty() != true ) {
						
						String originName = f.getOriginalFilename(); 
						String changeName = fileNameChanger(originName);
						
						try {
							//원하는 위치에 파일 저장
							f.transferTo(new File(saveDirectory + "/" + changeName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						// 3. list에 파일 정보 담기
						ProductImages at = new ProductImages();
						at.setOriginname(originName);
						at.setChangename(changeName);
						at.setImgpath(imgpath);
						
						attachList.add(at);
					}
				}		
		
		
		int result1 = indexDAO.insertProduct(indexProduct);
		
		if( result1 == 0 ) throw new ProductException("상품 등록 실패");
		
		if(attachList.size() > 0) {
			for(ProductImages a : attachList) {
				
				 for(int i = 0; i < attachList.size(); i++) {   
			            
			            if(i == 0) {
			            	attachList.get(i).setImglevel(0);
			            }
			            else {
			            	attachList.get(i).setImglevel(1);
			            }
				
				int result2 = indexDAO.insertProductImg(a);
				if( result2 == 0 ) throw new ProductException("첨부파일 추가 실패");
			}
		}

	}
		return result1;
}
	
	

	@Override
	public List<ProductImages> selectProductImagesList(int pno) {
				
				return indexDAO.selectProductImagesList(pno);
			}

	@Override
	public int deleteProduct(int pno) {
			
				return indexDAO.deleteProduct(pno);
				
			}

	@Override
	public Map<String, Object> productUpdateList(int pno) {
		
			return indexDAO.productUpdateList(pno);
		}

	@Override
	public int updateProduct(IndexProduct indexProduct, MultipartFile[] upFiles, HttpServletRequest req, int pno) {
			
			//원본 게시글 불러와 수정하기
			IndexProduct ip = indexDAO.productUpdate(pno);
			
			ip.setPname(indexProduct.getPname());
			ip.setPprice(indexProduct.getPprice());
			ip.setPexplain(indexProduct.getPexplain());
			ip.setSale(indexProduct.getSale());
			ip.setSaleprice(indexProduct.getSaleprice());
			
			
			int result1 = indexDAO.productUpdateEnd(ip);
			if(result1 == 0) throw new ProductException("상품 수정 실패");
			
			
			//원본 파일 불러와 수정하기
			//1.파일 저장 경로 선언
			String saveDir = req.getServletContext().getRealPath("/resources/boardUpload");
			String imgpath = saveDir + "/";
			
			//2.원본 파일정보 불러오기
			ProductImages pi = indexDAO.productImagesList(pno);
			System.out.println(pi);
			
			
				
			//3.입력한 파일 정보 불러오기
			for(MultipartFile f : upFiles) {
				//4.파일이 비어있지 않다면
				if( f.isEmpty() != true ) {
							
							//5.원본 파일 삭제
							boolean fileDelete = new File(saveDir + "/" + pi.getChangename()).delete();
									
							System.out.println("파일 삭제 여부 확인 : " + fileDelete);
							
							String originName = f.getOriginalFilename();
							System.out.println(originName);
							String changeName = fileNameChanger(originName);
							System.out.println(changeName);
							
							try {
							//6. 파일 저장
								f.transferTo(new File(saveDir + "/" + changeName));
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
							//7.ProductImages에 파일 정보 담기
							pi.setOriginname(originName);
							pi.setChangename(changeName);
							pi.setImgpath(imgpath);
						}
							
			}
			//8. 새로운 파일정보 업데이트
			int result2 = indexDAO.productImagesUpdateEnd(pi);
			if( result2 == 0 ) throw new ProductException("파일 수정 실패!");
		
			return result1;
	}
		
		
	// 단순 파일 이름 변경용 메소드 
	public String fileNameChanger(String oldFileName) {

				//확장자 추출
				// '.'이 처음 발견되는 위치에 + 1을 더해 그 위치서부터 가져오기(즉, 확장자 추출)
				String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				// 1~ 999까지
				int rnd = (int)(Math.random() * 1000);

				return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
						
					}

	
			
		
		
		
		}
	