package proxima.informatica.academy.seventh.surveyquestion.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyquestionsService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysQuestions;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UpdateSurveyquestionsServlet")
public class UpdateSurveyquestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdateSurveyquestionsServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSurveyquestionsServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("UpdateSurveyquestionsServlet - doPost - START");
		SurveysQuestions item = new SurveysQuestions();
		String surveyId = request.getParameter("surveyId");
		String questionId = request.getParameter("questionId");
		String position = request.getParameter("position");

		item.setSurveyId(Long.parseLong(surveyId));
		item.setQuestionId(Long.parseLong(questionId));
		item.setPosition(Integer.parseInt(position));

		if (SurveyquestionsService.getInstance().updateSurveyquestions(item)) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
