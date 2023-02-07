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
 * 
 * @author Giacomo Della Luna
 *
 */

/**
 * Servlet implementation class InsertSurveyquestionServlet
 */
@WebServlet("/InsertSurveyquestionsServlet")
public class InsertSurveyquestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertSurveyquestionsServlet.class);


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertSurveyquestionsServlet() {
		super();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		logger.debug("InsertSurveyquestionsServlet - START");
		
		SurveysQuestions item = new SurveysQuestions();

		item.setSurveyId(Long.parseLong(request.getParameter("surveyId")));
		item.setQuestionId(Long.parseLong(request.getParameter("questionId")));
		item.setPosition(Integer.parseInt(request.getParameter("position")));
		boolean responseValue = SurveyquestionsService.getInstance().insert(item);
		
		logger.debug("InsertSurveyServlet - END");
		logger.debug("InsertSurveyServlet.DEBUG - responseValue: " + responseValue);
			
		
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
