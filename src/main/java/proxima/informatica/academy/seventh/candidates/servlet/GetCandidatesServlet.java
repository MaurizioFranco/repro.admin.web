package proxima.informatica.academy.seventh.candidates.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;

/**
 * @author AntoIannaccone
 */

@WebServlet("/GetCandidatesServlet")
public class GetCandidatesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(GetCandidatesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public GetCandidatesServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetCandidatesServlet.START");
		Candidates item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetCandidatesServlet.DEBUG - roleId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = CandidatesService.getInstance().selectById(itemIdInt);
			logger.debug("GetCandidatesServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetCandidatesServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}
}