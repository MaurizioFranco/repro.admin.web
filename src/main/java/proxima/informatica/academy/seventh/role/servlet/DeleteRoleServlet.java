package proxima.informatica.academy.seventh.role.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.RoleService;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteRoleServlet")
public class DeleteRoleServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteRoleServlet.class);

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRoleServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DeleteRoleServlet.START");
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		
		boolean responseValue = RoleService.getInstance().deleteById(roleId) ;
        logger.debug("DeleteRoleServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			request.setAttribute("deleteStatus", "OK");
			request.getRequestDispatcher("role.jsp").forward(request, response);
		} else {
			request.setAttribute("deleteStatus", "KO");
			request.getRequestDispatcher("role.jsp").forward(request, response);
		}
	}

}
