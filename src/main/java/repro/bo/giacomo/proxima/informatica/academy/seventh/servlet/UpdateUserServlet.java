package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.UserDto;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService;

/**
 * Servlet implementation class UpdateUserServlet
 */
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDto user = new UserDto();
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setDateofbirth(Date.valueOf(request.getParameter("dateofbirth")));
		user.setRegdate(Timestamp.valueOf(LocalDateTime.parse(request.getParameter("regdate"))));
		user.setRole(Integer.valueOf(request.getParameter("role")));
		user.setNote(request.getParameter("note"));
		user.setImgpath(request.getParameter("imgpath"));
		if(request.getParameter("enabled") != null)
			user.setEnabled(true);
		else
			user.setEnabled(false);
		System.out.println(request.getParameter("enabled"));
		if(UserService.getInstance().updateUser(user)) {
			request.setAttribute("updateUser", "OK");
			request.getRequestDispatcher("user.jsp").forward(request, response); 
		}else {
			request.setAttribute("updateUser", "KO");
			request.getRequestDispatcher("user.jsp").forward(request, response); 
		}
	}

}
