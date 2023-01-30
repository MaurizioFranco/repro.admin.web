package proxima.informatica.academy.seventh.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.seventh.user.service.UserService;

import java.io.IOException;
import java.util.List;

import org.proxima.common.mail.MailUtility;

/**
 * Servlet implementation class CompleteRegistrationServlet
 */
@WebServlet("/CompleteRegistrationServlet")
public class CompleteRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompleteRegistrationServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		int id = Integer.parseInt(request.getParameter("userId"));
		if (password1.equals(password2)) {

			UserDto user = UserService.getInstance().selectById(id);
			user.setPassword(password1);
			UserService.getInstance().updateUser(user);
			sendEmailToAdmin(id);

			request.setAttribute("passwordRegistration", "OK");
			request.getRequestDispatcher("login.jsp").forward(request, response);

		} else {
			request.setAttribute("registrationFailed", "KO");
			request.getRequestDispatcher("completeRegistration.jsp").forward(request, response);
		}
	}

	private void sendEmailToAdmin(int userId) {
		List<UserDto> listAdmin = UserService.getInstance().getAllUsersByRole();
		String[] adminEmails = new String[listAdmin.size()];
		System.out.println(listAdmin.size());
		for (int i = 0; i < listAdmin.size(); i++) {
			adminEmails[i] = listAdmin.get(i).getEmail();
		}
		
		MailUtility.sendSimpleMail(adminEmails, "Confirm Registration",
				"Clicca <a href='http://localhost:8080/repro.admin.web/updateUser.jsp?userId="	+ userId + "'>qui</a> per completare la registrazione");
	}

}