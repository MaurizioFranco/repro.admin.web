package proxima.informatica.academy.seventh.candidates.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;
import centauri.academy.proxima.cerepro.entity.CandidateStates;

/**
 * @author AntoIannaccone
 */

@WebServlet("/UpdateCandidatesServlet")
public class UpdateCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdateCandidatesServlet.class);
       
	public UpdateCandidatesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateCandidatesServlet.doGet START - " + request.getQueryString());
		logger.debug("UpdateCandidatesServlet.doGet DEBUG - id: " + request.getParameter("id"));
		Candidates candidate = new Candidates();
		candidate.setId(Long.parseLong(request.getParameter("id")));
		candidate.setUser_id(Long.parseLong(request.getParameter("user_id")));
		candidate.setCourse_code(request.getParameter("course_code"));
//		candidate.setCandidacy_date_time(request.getParameter("candidacy_date_time"));
		candidate.setFirstname(request.getParameter("firstname"));
		candidate.setLastname(request.getParameter("lastname"));
		candidate.setEmail(request.getParameter("email"));
//		candidate.setRegdate(request.getParameter("regdate"));
		candidate.setEmail(request.getParameter("inserted_by"));
//		candidate.setCandidate_state_code(request.getParameter("candidate_state_code"));

		boolean responseValue = CandidatesService.getInstance().updateCandidates(candidate) ;
        logger.debug("InsertCandidatesServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateCandidatesServlet.START - " + request.getQueryString());
		logger.debug("UpdateCandidatesServlet.DEBUG - id: " + request.getParameter("id"));
		Candidates candidate = new Candidates();
		candidate.setId(Long.parseLong(request.getParameter("id")));
		candidate.setUser_id(Long.parseLong(request.getParameter("user_id")));
		candidate.setCourse_code(request.getParameter("course_code"));
//		candidate.setCandidacy_date_time(request.getParameter("candidacy_date_time"));
		candidate.setFirstname(request.getParameter("firstname"));
		candidate.setLastname(request.getParameter("lastname"));
		candidate.setEmail(request.getParameter("email"));
//		candidate.setRegdate(request.getParameter("regdate"));
		candidate.setEmail(request.getParameter("inserted_by"));
//		candidate.setCandidate_state_code(request.getParameter("candidate_state_code"));

		boolean responseValue = CandidatesService.getInstance().updateCandidates(candidate) ;
        logger.debug("InsertCandidatesServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
