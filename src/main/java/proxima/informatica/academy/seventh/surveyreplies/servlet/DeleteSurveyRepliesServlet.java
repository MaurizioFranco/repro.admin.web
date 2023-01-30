package proxima.informatica.academy.seventh.surveyreplies.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyrepliesDto;
import proxima.informatica.academy.hibernate.SurveyrepliesManager;
import proxima.informatica.academy.seventh.surveyreplies.service.SurveyRepliesService;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Servlet implementation class DeleteUserService
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idSelected = request.getParameter("selectedSurveyrepliesId");
		int id = Integer.parseInt(idSelected);
		boolean result = false;
		logger.debug("sto eliminando");
		
		try {
			result = deleteRowSurveyReplies(id);
			logger.debug("result = "+result);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == true) {
			request.setAttribute("deleteSurveyReplies","OK");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
		}else {
			request.setAttribute("deleteSurveyReplies","KO");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
		}
		
		//request.getRequestDispatcher("users.jsp").forward(request,response);
	}
	
	private boolean deleteRowSurveyReplies(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		SurveyrepliesDto survey_replies = SurveyrepliesManager.selectById(id);
		logger.debug("" + survey_replies);
		SurveyRepliesService.getInstance().deleteSurveyreplies(survey_replies);
		if(SurveyRepliesService.getInstance().selectSurveyrepliesById(id) == null) {
			value = true;
		}
		return value;
	}

}
