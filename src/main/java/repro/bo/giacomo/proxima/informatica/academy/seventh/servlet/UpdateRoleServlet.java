package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.RoleDto;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService;

import java.io.IOException;

/**
 * Servlet implementation class UpdateRoleServlet
 */
public class UpdateRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoleServlet() {
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
		RoleDto role = new RoleDto();
		role.setId(Integer.parseInt(request.getParameter("id")));
		role.setLabel(request.getParameter("label"));
		role.setDescription(request.getParameter("description"));
		role.setLevel(Integer.parseInt(request.getParameter("level")));

		if(RoleService.getInstance().updateRole(role)) {
			request.setAttribute("updateRole", "OK");
			request.getRequestDispatcher("role.jsp").forward(request, response); 
		}else {
			request.setAttribute("updateRole", "KO");
			request.getRequestDispatcher("role.jsp").forward(request, response); 
		}
	}

}
