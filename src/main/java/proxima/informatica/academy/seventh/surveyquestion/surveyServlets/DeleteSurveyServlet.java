package proxima.informatica.academy.seventh.surveyquestion.surveyServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/DeleteSurveyServlet")
public class DeleteSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteSurveyServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSurveyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int surveyId = Integer.parseInt(request.getParameter("surveyId"));
		logger.debug("Survey ID to delete: "+surveyId);
		SurveyDto surveyToDelete = SurveyService.getInstance().selectSurveyById(surveyId);
		SurveyService.getInstance().deleteSurvey(surveyToDelete);
		
		if(SurveyService.getInstance().selectSurveyById(surveyId) == null) {
			request.setAttribute("deleteSurvey", "OK");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}else {
			request.setAttribute("deleteSurvey", "KO");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}
	}

}