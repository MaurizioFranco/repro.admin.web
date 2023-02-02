package proxima.informatica.academy.seventh.candidates;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

/**
 * @author AntoIannaccone
 */

@WebServlet("/InsertCandidatesServlet")
public class InsertCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertCandidatesServlet.class);

	/**
	 * Default constructor.
	 */
	public InsertCandidatesServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("InsertCandidatesServlet.START");
		Candidates candidate = new Candidates();
		
		Timestamp Candidacy_date_time = Timestamp.valueOf(LocalDateTime.now());
		candidate.setCourse_code(request.getParameter("course_code"));
		candidate.setCandidacy_date_time(Candidacy_date_time);
		
		boolean responseValue = CandidatesService.getInstance().insertCandidates(candidate) ;
        logger.debug("InsertCandidateServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
}
