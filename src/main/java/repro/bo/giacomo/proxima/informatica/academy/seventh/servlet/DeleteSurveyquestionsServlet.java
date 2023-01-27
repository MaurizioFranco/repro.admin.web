package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyquestionsDto;
import proxima.informatica.academy.hibernate.AbstractDBManager;
import proxima.informatica.academy.hibernate.SurveyquestionsManager;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.SurveyquestionsService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class DeleteSurveyquestionsServlet
 */
public class DeleteSurveyquestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteSurveyquestionsServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteSurveyquestionsServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.debug("ID SurveyquestionsDto received" + request.getParameter("sqId"));
		SurveyquestionsDto sq = new SurveyquestionsDto();

		sq = SurveyquestionsService.getInstance().selectById(Integer.parseInt(request.getParameter("sqId")));

		logger.debug("SurveyquestionsDto received to delete" + sq.toString());
		if (SurveyquestionsService.getInstance().deleteSurveyquestion(sq)) {
			request.setAttribute("deleteSurveyquestions", "OK");
			request.getRequestDispatcher("surveyquestions.jsp").forward(request, response);
		} else {
			request.setAttribute("deleteSurveyquestions", "KO");
			request.getRequestDispatcher("surveyquestions.jsp").forward(request, response);
		}
	}

}
