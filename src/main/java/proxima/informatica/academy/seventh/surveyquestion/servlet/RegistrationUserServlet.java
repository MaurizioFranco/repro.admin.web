package proxima.informatica.academy.seventh.surveyquestion.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.seventh.surveyquestion.service.UserService;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;


/**
 * Servlet implementation class RegistrationUserServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		UserDto user = new UserDto();
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
//		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setDateofbirth(Date.valueOf(request.getParameter("dateofbirth")));
		user.setRegdate(Timestamp.valueOf(LocalDateTime.now()));
		user.setRole(10);
		user.setImgpath(request.getParameter("imgpath"));
		user.setNote(request.getParameter("note"));
		user.setEnabled(false);
//		if (request.getParameter("enabled") != null)
//			user.setEnabled(true);
//		else
//			user.setEnabled(false);
		String UPLOAD_DIRECTORY = "C:\\logs\\uploads";
		for (Part part : request.getParts()) {
			String fileName = getFileName(part);
			part.write(UPLOAD_DIRECTORY + File.separator + fileName);
		}

		if (UserService.getInstance().insert(user)) {
			request.setAttribute("firstRegistration", "OK");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("registration.html").forward(request, response);
		}
	}
	
	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename"))
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
		}
		return "test.txt";
	}

}
