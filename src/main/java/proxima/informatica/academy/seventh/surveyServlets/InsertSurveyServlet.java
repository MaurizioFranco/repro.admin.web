package proxima.informatica.academy.seventh.surveyServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyService;
import proxima.informatica.academy.seventh.surveyreplies.servlet.InsertSurveyRepliesServlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Surveys;

@WebServlet("/InsertSurveyServlet")
public class InsertSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertSurveyRepliesServlet.class);

	public InsertSurveyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Surveys survey = new Surveys();

		logger.debug("InsertSurveyServlet - START");

		survey.setLabel(request.getParameter("label"));
		survey.setTime(Integer.valueOf(request.getParameter("time")));
		survey.setDescription(request.getParameter("description"));
		boolean responseValue = SurveyService.getInstance().insert(survey);
		
		logger.debug("InsertSurveyServlet - END");
		logger.debug("InsertSurveyServlet - responseValue: " + responseValue);
		
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
