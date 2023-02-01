package proxima.informatica.academy.seventh.candidates;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;
import centauri.academy.proxima.cerepro.entity.Roles;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;
import proxima.informatica.academy.seventh.service.RoleService;

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

		candidate.setUser_id(Long.parseLong(request.getParameter("user_id")));
		candidate.setCourse_code(request.getParameter("course_code"));
//		candidate.setCandidacy_date_time(request.getParameter("candidacy_date_time");
		candidate.setFirstname(request.getParameter("firstname"));
		candidate.setLastname(request.getParameter("lastname"));
		candidate.setEmail(request.getParameter("email"));
//		candidate.setRegdate(request.getParameter("regdate"));
		candidate.setEmail(request.getParameter("inserted_by"));
//		candidate.setCandidate_state_code(request.getParameter("candidate_state_code"));
		
//        boolean responseValue = CandidatesService.getInstance().insert(candidate) ;
		boolean responseValue = false ;
        logger.debug("InsertCandidateServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
}
