package proxima.informatica.academy.seventh.role.servlet;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Roles;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.RoleService;

/**
 * Servlet implementation class GetRoleServlet
 */
@WebServlet("/GetRoleServlet")
public class GetRoleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final static Logger logger = LoggerFactory.getLogger(GetRoleServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetRoleServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetRoleServlet.START");
		Roles item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetRoleServlet.DEBUG - roleId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = RoleService.getInstance().selectById((long) itemIdInt);
			logger.debug("GetRoleServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetRoleServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}

}
