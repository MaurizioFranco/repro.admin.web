package proxima.informatica.academy.seventh.role.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.RoleDto;
import proxima.informatica.academy.seventh.role.service.RoleService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class UpdateRoleServlet
 */
@WebServlet("/UpdateRoleServlet")
public class UpdateRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdateRoleServlet.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoleServlet() {
        super();
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateRoleServlet.doGet START - " + request.getQueryString());
		logger.debug("UpdateRoleServlet.doGet DEBUG - id: " + request.getParameter("id"));
		RoleDto role = new RoleDto();
		role.setId(Integer.parseInt(request.getParameter("id")));
		role.setLabel(request.getParameter("label"));
		role.setDescription(request.getParameter("description"));
		role.setLevel(Integer.parseInt(request.getParameter("level")));

		boolean responseValue = RoleService.getInstance().updateRole(role) ;
        logger.debug("InsertRoleServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateRoleServlet.START - " + request.getQueryString());
		logger.debug("UpdateRoleServlet.DEBUG - id: " + request.getParameter("id"));
		logger.debug("UpdateRoleServlet.DEBUG - id: " + request.getAttribute("id"));
		RoleDto role = new RoleDto();
		role.setId(Integer.parseInt(request.getParameter("id")));
		role.setLabel(request.getParameter("label"));
		role.setDescription(request.getParameter("description"));
		role.setLevel(Integer.parseInt(request.getParameter("level")));

		boolean responseValue = RoleService.getInstance().updateRole(role) ;
        logger.debug("InsertRoleServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
