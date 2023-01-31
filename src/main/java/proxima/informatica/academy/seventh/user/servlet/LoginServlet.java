package proxima.informatica.academy.seventh.user.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.user.result.LoginResult;
import proxima.informatica.academy.seventh.user.service.UserService;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(LoginServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("DEBUG - doPost");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("Login Servlet: " + request.getParameter("url"));
		LoginResult loginResult = UserService.getInstance().login(email, password);

		if (loginResult.isLoginResponse()) {
			request.getSession().setAttribute("userLoggedEmail", email);
			if(request.getParameter("url") != null) {
				response.sendRedirect(request.getParameter("url"));			
				return;
			}
			request.getRequestDispatcher("user.jsp").forward(request, response);
		} else {
			request.setAttribute("loginFailed", loginResult.getLoginMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}
