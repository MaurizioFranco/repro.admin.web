package proxima.informatica.academy.seventh.surveyServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyService;

import java.io.IOException;

import centauri.academy.proxima.cerepro.entity.Surveys;

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
		Surveys survey = new Surveys();

		survey.setLabel(request.getParameter("label"));
		survey.setTime(Integer.valueOf(request.getParameter("time")));
		survey.setDescription(request.getParameter("description"));

		if (SurveyService.getInstance().insert(survey) == true) {
			request.setAttribute("insertSurvey", "OK");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		} else {
			request.setAttribute("insertSurvey", "KO");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}
	}

}
