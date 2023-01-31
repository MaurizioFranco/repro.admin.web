package proxima.informatica.academy.seventh.surveyquestion.surveyServlets;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.seventh.role.servlet.GetRoleServlet;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyService;

/**
 * 
 * @author Matteo Peruzza
 *
 */

@WebServlet("/UpdateSurveyServlet")
public class UpdateSurveyServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetRoleServlet.class);

    public UpdateSurveyServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateSurveyServlet.START");
		SurveyDto survey = new SurveyDto();
		SurveyDto surveyToCheck = null;
		try {
		survey.setId(Integer.parseInt(request.getParameter("surveyIdToUpdate")));
		survey.setLabel(request.getParameter("surveyLabelToUpdate"));
		survey.setTime(Long.valueOf(request.getParameter("surveyTimeToUpdate")));
		survey.setDescription(request.getParameter("surveyDescriptionToUpdate"));
		logger.debug("UpdateSurveyServlet.DEBUG - update: " + survey);
		surveyToCheck = SurveyService.getInstance().updateSurvey(survey);
		logger.debug("UpdateSurveyServlet.DEBUG - updatedItem: " + surveyToCheck);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		if(surveyToCheck != null) {
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

