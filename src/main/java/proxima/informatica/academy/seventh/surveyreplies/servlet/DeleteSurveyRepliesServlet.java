package proxima.informatica.academy.seventh.surveyreplies.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyRepliesService;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysReplies;


/**
 * Servlet implementation class DeleteUserService
 * @author Giammarco Lucchetti
 */
@WebServlet("/DeleteSurveyRepliesServlet")
public class DeleteSurveyRepliesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteSurveyRepliesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSurveyRepliesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DeleteSurveyServlet-START");
		String idSelected = request.getParameter("selectedSurveyrepliesId");
		int id = Integer.parseInt(idSelected);
		boolean result = false;
		
		try {
			result = deleteRowSurveyReplies(id);
			logger.debug("Delete result = "+result);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == true) {
			request.setAttribute("deleteSurveyReplies","OK");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
//			response.getWriter().append("OK");
		}else {
			request.setAttribute("deleteSurveyReplies","KO");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
//			response.getWriter().append("KO");
		}
	}
	
	private boolean deleteRowSurveyReplies(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		SurveysReplies survey_replies = SurveyRepliesService.getInstance().selectSurveyrepliesById(id);
		logger.debug("" + survey_replies);
		SurveyRepliesService.getInstance().deleteSurveyreplies(survey_replies);
		if(SurveyRepliesService.getInstance().selectSurveyrepliesById(id) == null) {
			value = true;
		}
		return value;
	}

}
