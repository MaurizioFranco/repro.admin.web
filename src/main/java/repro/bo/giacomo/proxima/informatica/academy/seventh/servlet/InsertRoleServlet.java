package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.RoleDto;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService;

/**
 * Servlet implementation class InsertRoleServlet
 */
public class InsertRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertRoleServlet() {
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
		RoleDto role = new RoleDto();

		role.setLabel(request.getParameter("label"));
		role.setDescription(request.getParameter("description"));
		role.setLevel(Integer.parseInt(request.getParameter("level")));

		if (RoleService.getInstance().insert(role)) {
			request.setAttribute("insertRole", "OK");
			request.getRequestDispatcher("role.jsp").forward(request, response);
		} else {
			request.setAttribute("insertRole", "KO");
			request.getRequestDispatcher("role.jsp").forward(request, response);
		}
	}

}
