package repro.bo.giacomo.proxima.informatica.academy.seventh.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyquestionsDto;
import repro.bo.giacomo.proxima.informatica.academy.seventh.service.SurveyquestionsService;

import java.io.IOException;

/**
 * Servlet implementation class InsertSurveyquestionServlet
 */
public class InsertSurveyquestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertSurveyquestionServlet() {
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
		SurveyquestionsDto sq = new SurveyquestionsDto();

		sq.setSurveyId(Integer.parseInt(request.getParameter("survey_id")));
		sq.setQuestionId(Integer.parseInt(request.getParameter("question_id")));
		sq.setPosition(Integer.parseInt(request.getParameter("position")));

		if (SurveyquestionsService.getInstance().insert(sq)) {
			request.setAttribute("insertSurveyquestions", "OK");
			request.getRequestDispatcher("surveyquestions.jsp").forward(request, response);
		} else {
			request.setAttribute("insertSurveyquestions", "KO");
			request.getRequestDispatcher("surveyquestions.jsp").forward(request, response);
		}
	}

}
