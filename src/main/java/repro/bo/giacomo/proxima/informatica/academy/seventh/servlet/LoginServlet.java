package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repro.bo.giacomo.proxima.informatica.academy.seventh.result.LoginResult;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService;


/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.debug("DEBUG - doPost");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		LoginResult loginResult = UserService.getInstance().login(email, password);

		if (loginResult.isLoginResponse()) {
			request.getSession().setAttribute("userLoggedEmail", email);
			request.getRequestDispatcher("user.jsp").forward(request, response);
		} else {
			request.setAttribute("loginFailed", loginResult.getLoginMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
