package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import BO.AddressBO;
import BO.RoleBO;
import Domain.Role;
import Domain.User;

public class UserDAO {
	public User validateLogin(String username,String password) throws ClassNotFoundException, SQLException{
        User user =null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username = '"+username+"' and password = '"+password+"';");
        ResultSet rs = preparedStatement.executeQuery();
        RoleBO roleBO = new RoleBO();
        AddressBO addressBO = new AddressBO();
        if(rs.next()) {
            Role role = roleBO.findRoleById(rs.getInt("role_id"));
            user = new User(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"),rs.getDate("dob"),rs.getInt("age"),rs.getString("contact_no"), rs.getString("email"),rs.getString("username"),rs.getString("password"), role);
            user.setAddressList(addressBO.findByUserId(user.getId()));
        }
        connection.close();
        return user;
    }
	
	public User findById(Integer id) throws ClassNotFoundException, SQLException {
		Connection con = DBConnection.getConnection();

               //fill your code here		

		return null;
		
	/**	public static void main(String[] args) throws Exception{
			UserDAO ud=new UserDAO();
			boolean usefound=ud.findUserByUsername("ram");
			if(Userfound) {
				System.out.println("User already exist");
				else {
					System.out.println("User not exist")
				}
			}
		}**/
	}
	public boolean findUserByUsername(String username) throws ClassNotFoundException, SQLException {
		Connection con = DBConnection.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from users where username=?");
		ps.setString(1,username);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) 
			return true;
               //fill your code here

		return false;		
	}
	public Integer createUser(User user) throws SQLException, ClassNotFoundException {
		Connection con = DBConnection.getConnection();
		
                //fill your code here
int userId=0;

		con.close();
		
		return userId ;
	}
	public void updateContactDetail(User user) throws SQLException, ClassNotFoundException{
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();


              //fill your code here


		con.close();
	}
	public void updateProfile(User user) throws SQLException, ClassNotFoundException{
		new UserDAO().updateProfile(user);
	}
}

