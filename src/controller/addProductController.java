package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDetailDao;
import dto.ProductDto;
import net.sf.json.JSONObject;

@WebServlet("/addPro")
public class addProductController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 처음 기능 구분을 위한 work
		String work = req.getParameter("work");
		ProductDetailDao dao = ProductDetailDao.getInstance();

		// 카테고리 페이지에서 상의,하의,신발,악세사리의 상품들 리스트를 출력하기 위한 리스트들
		List<ProductDto> list = new ArrayList<ProductDto>();
		List<ProductDto> list2 = new ArrayList<ProductDto>();
		List<ProductDto> list3 = new ArrayList<ProductDto>();
		List<ProductDto> list4 = new ArrayList<ProductDto>();
		List<ProductDto> list5 = new ArrayList<ProductDto>();

		HashMap<String, Object> map = new HashMap<String, Object>();

		// 리스트 버튼을 누르면 옆으로 이동하는 페이지를 넘겨주는 변수
		String slistNum = req.getParameter("listNum");

		int listNum;
		if (slistNum == null || slistNum.length() == 0) {
			listNum = 1;
		}
		try {
			listNum = Integer.parseInt(slistNum);

		} catch (NumberFormatException e) {
			listNum = 1;
		}

		// map에 리스트를 담아서 카테고리 페이지로 넘겨줌
		list = dao.getProductList(listNum, "all");
		map.put("listall", list);
		list2 = dao.getProductList(listNum, "top");
		map.put("listtop", list2);
		list3 = dao.getProductList(listNum, "bottom");
		map.put("listbottom", list3);
		list4 = dao.getProductList(listNum, "shoes");
		map.put("listshoes", list4);
		list5 = dao.getProductList(listNum, "accessary");
		map.put("listac", list5);
		String ln = listNum + "";
		map.put("listNum", ln.trim());
		if (work.equals("list")) {

			req.setAttribute("map", map);
			forward("detail.jsp", req, resp);
		}
		// 제품 추가를 누르면 제품추가 페이지로 이동
		else if (work.equals("add")) {
			resp.sendRedirect("addProduct.jsp");
		}
		// 제품 수정을 누르면 해당 페이지로 제품의 시퀀스번호를 가지고 이동
		else if (work.equals("update")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			ProductDto product = dao.getProduct(seq);
			req.setAttribute("product", product);
			forward("updateProduct.jsp", req, resp);
		}
		// 리스트들의 버튼을 누르면 db에서 제품들을 가져오는값
		else if (work.equals("display")) {
			String category = req.getParameter("category");

			list = dao.getProductList(listNum, category);

			map.put("display", list);

			JSONObject jobj = new JSONObject();
			jobj.put("map", map);

			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jobj);
		}
	}

	@Override // 제품을 추가하면 post로 오기때문에 아래 함수 실행
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		ProductDetailDao dao = ProductDetailDao.getInstance();
		// 저장되는 경로
		String savePath = req.getServletContext().getRealPath("/productimg");
		System.out.println(savePath);
		//데이터 크기
		int sizeLimit = 1024 * 1024 * 15;
		//인코딩
		String encoding = "UTF-8";
		
		//addproduct.jsp에서 넘겨준 값을들 받아주기 위한 멀티 리퀘스트 생성
		MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, encoding, new DefaultFileRenamePolicy());
		
		// 넘어온 값 받아주기
		String name = multi.getParameter("p_name");
		String mertiral = multi.getParameter("p_material");
		String madeIn = multi.getParameter("p_madeIn");
		String p = multi.getParameter("price");
		String category = multi.getParameter("selbig");
		String kind = multi.getParameter("selsmall");
		String info = multi.getParameter("p_info");

		String filename = multi.getFilesystemName("fileload");

		String fileFullPath = savePath + "/" + filename;
		
		//확인용
		System.out.println(name + " " + mertiral + " " + madeIn + " " + p + " " + category + " " + kind + " "
				+ fileFullPath + " " + info + " ");
		
		//빈칸 확인
		if(!(name.equals("")||name==null||mertiral.equals("")||mertiral==null||madeIn.equals("")||madeIn==null||p.equals("")||p==null||category.equals("")||category==null||
				kind.equals("")||kind==null||info.equals("")||info==null||filename.equals("")||filename==null)) {
			
			int p_kind = Integer.parseInt(kind);
			int price = Integer.parseInt(p);
					
			//넘어온 값들로 dto 생성
			ProductDto dto = new ProductDto(name, info, mertiral, madeIn, price, category, p_kind, filename);
			//db에 제품 추가
			boolean isS = dao.insertProduct(dto);
			req.setAttribute("insert", isS);

			forward("addPAF.jsp", req, resp);
		}else {
			out.print("<script>alert('빈칸 없이 입력해 주세요'); location.href='addProduct.jsp';</script>");
			out.flush();
		}
	}

	// 디스패처 함수
	public void forward(String linkname, HttpServletRequest req, HttpServletResponse resp) {
		RequestDispatcher dispatcher = req.getRequestDispatcher(linkname);
		try {
			dispatcher.forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}