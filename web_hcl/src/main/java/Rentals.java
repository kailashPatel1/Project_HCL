

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BO.CompanyBO;
import BO.OrderDetailBO;
import BO.RentalAgreementBO;
import Domain.Address;
import Domain.Company;
import Domain.Discount;
import Domain.OrderDetail;
import Domain.Product;
import Domain.RentalPackage;
import Domain.User;

/**
 * Servlet implementation class Rentals
 */
@WebServlet("/Rentals")
public class Rentals extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rentals() {
        super();
        // TODO Auto-generated constructor stub
        
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NumberFormatException {
		// TODO Auto-generated method stub
		try{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String delDate =(String)request.getParameter("deliveryDate");
		String delTime = (String)request.getParameter("deliveryTime");
		Date deliveryDate =new Date();
		Address choosenAddress =(Address) session.getAttribute("address");
		Product p =(Product) session.getAttribute("product");
		//System.out.println(p);
		Discount discount =  (Discount)session.getAttribute("discount");
       // System.out.println(discount+"----discount");
		ArrayList<Product> ChoosedProductList = new ArrayList<Product>();
		ChoosedProductList.add((Product) session.getAttribute("product"));
		session.setAttribute("product",p);
    		request.setAttribute("product",p);
		//System.out.println(ChoosedProductList);
		String monCost = (String)session.getAttribute("monthCost");
		System.out.println(monCost+"monCost");
		Double mCos=(Double.parseDouble(monCost));
	    int cost = mCos.intValue();
	   // int cost=(Integer.parseInt(monCost));
	    //Integer cost = cost1.;
		OrderDetail orderObj = new OrderDetail(user, user.getUsername(), user.getContactNo(),new Date(), deliveryDate, delTime,
        		choosenAddress,ChoosedProductList,new ArrayList<RentalPackage>(), cost);
		orderObj= new OrderDetailBO().create(orderObj);
		String agreementNumber = "INS"+orderObj.getId() +"U" + orderObj.getUser().getId()+ "V"+0;
        if(orderObj!=null){
        	session.setAttribute("orderObj",orderObj);
        	request.setAttribute("orderObj",orderObj);
        }
		String totCost = (String)session.getAttribute("amount");
	    Double totalCos=(Double.parseDouble(totCost));
	    int totalCost = totalCos.intValue();
        //Integer totalCost=(Integer)session.getAttribute("amount");
        Calendar cal = Calendar.getInstance();
        cal.setTime(orderObj.getDeliveryDate());
        cal.add(Calendar.MONTH, discount.getTenure());
        Date expiryDate = cal.getTime();
        cal.add(Calendar.DATE, 1);
        Date renewalDate = cal.getTime();
        Company company = new CompanyBO().getCompany();
        Domain.RentalAgreement rentalAgreement= new Domain.RentalAgreement(agreementNumber,company, orderObj, discount.getTenure(),
        		orderObj.getOrderedDate(), orderObj.getDeliveryDate(), renewalDate,
    			expiryDate, discount, totalCost);
        rentalAgreement = new RentalAgreementBO().save(rentalAgreement);
        if(rentalAgreement!=null){
        	session.setAttribute("rentals",rentalAgreement);
        	request.setAttribute("rentals",rentalAgreement);
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("rentals.jsp");
		rd.include(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
