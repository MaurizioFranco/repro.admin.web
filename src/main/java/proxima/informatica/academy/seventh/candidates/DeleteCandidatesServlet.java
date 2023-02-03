package proxima.informatica.academy.seventh.candidates;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;
import centauri.academy.proxima.cerepro.repository.CandidatesRepository;

/**
 * @author AntoIannaccone
 */

@WebServlet("/DeleteCandidates")
public class DeleteCandidatesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteCandidatesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCandidatesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DeleteSurveyServlet-START");
		String idSelected = request.getParameter("selectedCandidatesId");
		int id = Integer.parseInt(idSelected);
		boolean responseValue = false;
		
		try {
			responseValue = deleteRowCandidates(id);
			logger.debug("Delete result = "+responseValue);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
	
	private boolean deleteRowCandidates(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		Candidates survey_replies = CandidatesService.getInstance().selectCandidatesById(id);
		logger.debug("" + survey_replies);
		CandidatesService.getInstance().deleteCandidates(survey_replies);
		if(CandidatesService.getInstance().selectCandidatesById(id) == null) {
			value = true;
		}
		return value;
	}
}