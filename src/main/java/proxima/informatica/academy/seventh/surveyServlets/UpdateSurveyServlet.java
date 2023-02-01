package proxima.informatica.academy.seventh.surveyServlets;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Surveys;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyService;

/**
 * 
 * @author Matteo Peruzza
 *
 */

@WebServlet("/UpdateSurveyServlet")
public class UpdateSurveyServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetSurveyServlet.class);

    public UpdateSurveyServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateSurveyServlet.START");
		Surveys survey = new Surveys();
		boolean surveyToCheck = false;
		try {
		survey.setId(Long.parseLong(request.getParameter("surveyIdToUpdate")));
		survey.setLabel(request.getParameter("surveyLabelToUpdate"));
		survey.setTime(Integer.valueOf(request.getParameter("surveyTimeToUpdate")));
		survey.setDescription(request.getParameter("surveyDescriptionToUpdate"));
		logger.debug("UpdateSurveyServlet.DEBUG - update: " + survey);
		surveyToCheck = SurveyService.getInstance().updateSurvey(survey);
		logger.debug("UpdateSurveyServlet.DEBUG - updatedItem: " + surveyToCheck);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		if(surveyToCheck == true) {
//			request.setAttribute("updateSurvey", "OK");
//			request.getRequestDispatcher("surveys.jsp").forward(request, response); 
			response.getWriter().append("OK");
		}else {
//			request.setAttribute("updateSurvey", "KO");
//			request.getRequestDispatcher("surveys.jsp").forward(request, response); 
			response.getWriter().append("KO");
		}
	}

}

