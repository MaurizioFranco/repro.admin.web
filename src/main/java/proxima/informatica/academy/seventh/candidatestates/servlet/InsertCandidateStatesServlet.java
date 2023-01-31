package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.CandidateStatesDto;
import proxima.informatica.academy.hibernate.QuestionsManager;
import proxima.informatica.academy.seventh.candidatestates.service.CandidateStatesService;

/**
 * Servlet implementation class RegistrationUserServlet
 */
@WebServlet("/InsertCandidateStatesServlet")
public class InsertCandidateStatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final static Logger logger = LoggerFactory.getLogger(QuestionsManager.class);
	
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
		CandidateStatesService.insert(candidate);
		
		boolean responseValue = CandidateStatesService.insert(candidate); ;
     	if (responseValue) {
			//response.getWriter().append("OK");
     		logger.debug("funzionante");
			request.getRequestDispatcher("candidatestates.jsp").forward(request, response);
		} else {
			logger.debug("non funzionante");
			//response.getWriter().append("KO");
			request.getRequestDispatcher("candidatestates.jsp").forward(request, response);
		}
	
	}
}
