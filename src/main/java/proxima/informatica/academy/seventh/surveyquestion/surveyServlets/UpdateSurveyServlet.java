package proxima.informatica.academy.seventh.surveyquestion.surveyServlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyService;


@WebServlet("/UpdateSurveyServlet")
public class UpdateSurveyServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSurveyServlet() {
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
		// TODO Auto-generated method stub
		SurveyDto survey = new SurveyDto();
		survey.setId(Integer.parseInt(request.getParameter("id")));
		survey.setLabel(request.getParameter("label"));
		survey.setTime(Long.valueOf(request.getParameter("time")));
		survey.setDescription(request.getParameter("description"));
		SurveyDto surveyToCheck = SurveyService.getInstance().updateSurvey(survey);

		if(surveyToCheck != null) {
			request.setAttribute("updateSurvey", "OK");
			request.getRequestDispatcher("surveys.jsp").forward(request, response); 
		}else {
			request.setAttribute("updateSurvey", "KO");
			request.getRequestDispatcher("surveys.jsp").forward(request, response); 
		}
	}

}

