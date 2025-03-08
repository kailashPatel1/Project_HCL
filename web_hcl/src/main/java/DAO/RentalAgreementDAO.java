package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

//import com.mysql.jdbc.Statement;

import Domain.RentalAgreement;

public class RentalAgreementDAO {
	public RentalAgreement save(RentalAgreement rentalAgreement) throws SQLException, ClassNotFoundException{
		Connection con = DBConnection.getConnection();
		
               //fill your code here

		return rentalAgreement;
		
	}
	
}
