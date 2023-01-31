package proxima.informatica.academy.seventh.surveyquestion.surveyServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyService;

import java.io.IOException;

@WebServlet("/InsertSurveyServlet")
public class InsertSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InsertSurveyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SurveyDto survey = new SurveyDto();

		survey.setLabel(request.getParameter("label"));
		survey.setTime(Long.valueOf(request.getParameter("time")));
		survey.setDescription(request.getParameter("description"));

		if (SurveyService.getInstance().insertSurvey(survey) != 0) {
			request.setAttribute("insertSurvey", "OK");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		} else {
			request.setAttribute("insertSurvey", "KO");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}
	}

}
