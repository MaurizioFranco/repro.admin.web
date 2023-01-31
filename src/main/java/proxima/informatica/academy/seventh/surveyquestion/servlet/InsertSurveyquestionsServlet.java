package proxima.informatica.academy.seventh.surveyquestion.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyquestionsDto;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyquestionsService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class InsertSurveyquestionServlet
 */
@WebServlet("/InsertSurveyquestionServlet")
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
		SurveyquestionsDto item = new SurveyquestionsDto();

		item.setSurveyId(Integer.parseInt(request.getParameter("surveyId")));
		item.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		item.setPosition(Integer.parseInt(request.getParameter("position")));

		if (SurveyquestionsService.getInstance().insert(item)) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
