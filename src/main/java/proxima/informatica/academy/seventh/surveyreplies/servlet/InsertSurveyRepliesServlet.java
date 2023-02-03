package proxima.informatica.academy.seventh.surveyreplies.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.LocalTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysReplies;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyRepliesService;

/**
 * Servlet implementation class LoginServlet
 * 
 * @author Giammarco Lucchetti
 */
@WebServlet("/InsertSurveyRepliesServlet")
public class InsertSurveyRepliesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertSurveyRepliesServlet.class);

	/**
	 * Default constructor.
	 */
	public InsertSurveyRepliesServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.debug("InsertSurveyRepliesServlet - START");
		
		String survey_id = request.getParameter("survey_id");
		String user_id = request.getParameter("user_id");
		String answers = request.getParameter("answers");
		String pdfFileName = request.getParameter("pdffilename");
		String points = request.getParameter("points");
		boolean resultValue = false;

		try {
			resultValue = insertNewSurveyReplies(survey_id, user_id, answers, pdfFileName, points);
		} catch (ClassNotFoundException | SQLException | IOException | ParseException e) {
			e.printStackTrace();
		}

		logger.debug("InsertSurveyRepliesServlet - END");
		logger.debug("InsertSurveyRepliesServlet - responseValue: " + resultValue);
		
		if (resultValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

	private boolean insertNewSurveyReplies(String survey_id, String user_id, String answers, String pdfFileName,
			String points) throws ClassNotFoundException, SQLException, IOException, ParseException {
		boolean result = false;
		SurveysReplies surveyRepliesToInsert = new SurveysReplies();
		Timestamp SurveyRepliesInsertedTime = Timestamp.valueOf(LocalDateTime.now());
		Long surveyid = Long.parseLong(survey_id);
		Long userid = Long.parseLong(user_id);

		surveyRepliesToInsert.setSurveyId(surveyid);
		surveyRepliesToInsert.setUserId(userid);
		surveyRepliesToInsert.setStartTime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setEndTime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setAnswer(answers);
		surveyRepliesToInsert.setPdfFileName(pdfFileName);
		surveyRepliesToInsert.setPoints(points);

		result = SurveyRepliesService.getInstance().insertSurveyreplies(surveyRepliesToInsert);

		return result;
	}
}
