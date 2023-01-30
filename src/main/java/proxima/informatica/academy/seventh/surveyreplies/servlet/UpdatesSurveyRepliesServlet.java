package proxima.informatica.academy.seventh.surveyreplies.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.AbstractCommonDto;
import proxima.informatica.academy.dto.SurveyrepliesDto;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.hibernate.SurveyrepliesManager;
import proxima.informatica.academy.seventh.surveyreplies.service.SurveyRepliesService;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Servlet implementation class DeleteUserService
 * @author Giammarco Lucchetti
 */
@WebServlet("/UpdateSurveyRepliesServlet")
public class UpdatesSurveyRepliesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdatesSurveyRepliesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatesSurveyRepliesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateSurveyServlet-START");
		String idSelected = request.getParameter("surveyRepliesIdToUpdate");
		logger.debug("ID Selected : " + idSelected);
		int id = Integer.parseInt(idSelected);
		int result = 0;
		String survey_id = request.getParameter("survey_IdToUpdate");
		String user_id = request.getParameter("user_IdToUpdate");
		String answers = request.getParameter("answersToUpdate");
		String pdfFileName = request.getParameter("pdfFileNameToUpdate");
		String points = request.getParameter("pointsToUpdate");
		
		try {
			result = updateSurveyReplies(id,survey_id,user_id,answers,pdfFileName,points);
			logger.debug("Update result  = "+result);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {	
//			request.setAttribute("updateSurevyreplies","OK");
//			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
			response.getWriter().append("OK");
		}else {
//			request.setAttribute("updateSurveyreplies","KO");
//			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
			response.getWriter().append("OK");
		}
	}
	
	private int updateSurveyReplies(int id,String survey_id,String user_id,String answers,String pdfFileName,String points) throws ClassNotFoundException, SQLException, IOException {
		int value = 0;
		SurveyrepliesDto surveyRepliesToInsert = SurveyRepliesService.getInstance().selectSurveyrepliesById(id);
		Timestamp SurveyRepliesInsertedTime = Timestamp.valueOf(LocalDateTime.now());
//		BigInteger surveyid = new BigInteger(survey_id);
//		BigInteger userid = new BigInteger(user_id);
//		surveyRepliesToInsert.setSurvey_id(surveyid);
//		surveyRepliesToInsert.setUser_id(userid);
		surveyRepliesToInsert.setStarttime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setEndtime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setAnswers(answers);
		surveyRepliesToInsert.setPdffilename(pdfFileName);
		surveyRepliesToInsert.setPoints(points);
		if(SurveyRepliesService.getInstance().updateSurveyReplies(surveyRepliesToInsert)!= null) {
			value = 1;
		}
		return value;
	}
}
