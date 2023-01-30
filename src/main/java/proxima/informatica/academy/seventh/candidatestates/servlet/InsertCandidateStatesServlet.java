package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import proxima.informatica.academy.dto.CandidateStatesDto;
import proxima.informatica.academy.hibernate.CandidateStatesManager;
import proxima.informatica.academy.seventh.surveyquestion.service.UserService;


/**
 * Servlet implementation class RegistrationUserServlet
 */
public class InsertCandidateStatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertCandidateStatesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		CandidateStatesDto candidate = new CandidateStatesDto();
		candidate.setRole_id(Integer.parseInt(request.getParameter("roleid")));
		candidate.setStatus_code(Integer.parseInt(request.getParameter("statuscode")));
		candidate.setStatus_color(request.getParameter("statuscolor"));
		candidate.setStatus_description(request.getParameter("stausdescription"));
		candidate.setStatus_label(request.getParameter("statuslabel"));
		CandidateStatesManager.insert(candidate);
	}
}
