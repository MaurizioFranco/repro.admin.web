package proxima.informatica.academy.seventh.role.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.RoleService;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.EntityInterface;

/**
 * @author matteo.peruzza@gmail.com
 */

@WebServlet("/GetAllRolesServlet")
public class GetAllRolesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetAllRolesServlet.class);

    public GetAllRolesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		logger.debug("GetAllRolesServlet.START");
		List<EntityInterface> items = null;
		try {
			items = RoleService.getInstance().getAllRoles();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		ObjectMapper mapper = new ObjectMapper();	
		String jsonResponse = mapper.writeValueAsString(items);
		response.getWriter().append(jsonResponse);
		logger.debug("GetAllRolesServlet.END");
	}

}