package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.CandidateStates;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidateStatesService;
import proxima.informatica.academy.seventh.service.CandidatesService;

/**
 * Servlet implementation class DeleteServlet
 */
/**
 * @author MarcoFabretti
 */
public class DeleteCandidateStatesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(DeleteCandidateStatesServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public DeleteCandidateStatesServlet() {
		super();
		}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("id"));
		boolean responseValue = CandidateStatesService.getInstance().deleteById((long) itemId) ;
        logger.debug(this.getClass().getSimpleName() + ".DEBUG - responseValue: " + responseValue);
        
        if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}

	}
}
