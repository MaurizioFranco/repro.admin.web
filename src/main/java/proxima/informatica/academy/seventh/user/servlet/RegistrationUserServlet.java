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
import proxima.informatica.academy.seventh.common.PropertiesManagerSingleton;
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
		String directory = null;
		try {
			directory = PropertiesManagerSingleton.getInstance().getProperty("properties.directory");		
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		User user = new User();
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setEmail(request.getParameter("email"));
		user.setDateofbirth(Date.valueOf(request.getParameter("dateofbirth")));
		user.setRegdate(Timestamp.valueOf(LocalDateTime.now()));
		user.setRole(10);
		user.setNote(request.getParameter("note"));
		user.setenabled(0);
		
		String fileName = null;
		String UPLOAD_DIRECTORY = directory;
		for (Part part : request.getParts()) {
			if (!getFileName(part).isEmpty()) {
				fileName = getFileName(part);
				user.setImgpath(directory + fileName);
				part.write(UPLOAD_DIRECTORY + File.separator + fileName);
			}else {
				user.setImgpath(null);
			}
		}
<<<<<<< HEAD

		boolean responseValue = UserService.getInstance().insert(user);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
=======
		if (user.getImgpath() != null) {
			if (UserService.getInstance().insert(user)) {
				request.setAttribute("firstRegistration", "OK");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("registration.html").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("registration.html").forward(request, response);
>>>>>>> branch 'master' of https://github.com/MaurizioFranco/repro.admin.web.git
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
