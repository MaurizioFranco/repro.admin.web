package proxima.informatica.academy.seventh.user.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import centauri.academy.proxima.cerepro.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import proxima.informatica.academy.seventh.service.UserService;


/**
 * Servlet implementation class RegistrationUserServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, 
maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet("/RegistrationUserServlet")
public class RegistrationUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationUserServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setEmail(request.getParameter("email"));
		user.setDateofbirth(Date.valueOf(request.getParameter("dateofbirth")));
		user.setRegdate(Timestamp.valueOf(LocalDateTime.now()));
		user.setRole(10);
		user.setImgpath(request.getParameter("imgpath"));
		user.setNote(request.getParameter("note"));
		user.setenabled(0);
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
