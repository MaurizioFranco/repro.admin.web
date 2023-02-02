package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.CandidateStates;
import centauri.academy.proxima.cerepro.entity.Roles;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidateStatesService;
import proxima.informatica.academy.seventh.service.RoleService;

/**
 * Servlet implementation class GetRoleServlet
 */
@WebServlet("/GetCandidateStateServlet")
public class GetCandidateStatesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(GetCandidateStatesServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetCandidateStatesServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetCandidateStatesServlet.START");
		CandidateStates item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetCandidateStateServlet - DEBUG - Id: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = CandidateStatesService.getInstance().selectById(itemIdInt);
			logger.debug("selectById - DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetCandidateStatesServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}

}
