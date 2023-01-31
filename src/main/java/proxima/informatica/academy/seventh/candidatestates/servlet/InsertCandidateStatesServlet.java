package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import centauri.academy.proxima.cerepro.entity.CandidateStates;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidateStatesService;


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

		CandidateStates candidate = new CandidateStates();
		candidate.setRole_id((long) Integer.parseInt(request.getParameter("roleid")));
		candidate.setStatus_code(Integer.parseInt(request.getParameter("statuscode")));
		candidate.setStatus_color(request.getParameter("statuscolor"));
		candidate.setStatus_description(request.getParameter("stausdescription"));
		candidate.setStatus_label(request.getParameter("statuslabel"));
		CandidateStatesService.getInstance().insert(candidate);
	}
}
