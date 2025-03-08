

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BO.BrandBO;
import BO.CatalogServiceAreaBO;
import BO.CatalogServiceSectorBO;
import BO.MaterialBO;
import BO.ProductBO;
import BO.ProductCategoryBO;
import BO.ProductRateBO;
import BO.ProductTypeBO;
import Domain.Brand;
import Domain.CatalogServiceArea;
import Domain.CatalogServiceSector;
import Domain.Material;
import Domain.Product;
import Domain.ProductCategory;
import Domain.ProductRate;
import Domain.ProductType;

/**
 * Servlet implementation class CreateProduct
 */
@WebServlet("/CreateProduct")
public class CreateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String name=(String)request.getParameter("name");
		String color=(String)request.getParameter("colors");
		String dimensions=(String)request.getParameter("dimensions");
		String city=(String)request.getParameter("city");
		String b=(String)request.getParameter("brand");
		String m=(String)request.getParameter("material");
		String css=(String)request.getParameter("catalogServiceSector");
		String csa=(String)request.getParameter("catalogServiceArea");
		String pc=(String)request.getParameter("productCategory");
		String pt=(String)request.getParameter("productType");
		String imageUrl=(String)request.getParameter("imageUrl");
		String rate=(String)request.getParameter("productRate");
		//fill your code here
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
