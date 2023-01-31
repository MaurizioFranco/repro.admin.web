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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("do get start");
//		System.out.println(request.getParameter("username"));
//		System.out.println(request.getParameter("password"));
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String survey_id = request.getParameter("survey_id_input");
		String user_id = request.getParameter("user_id_input");
		String answers = request.getParameter("answers_input");
		String pdfFileName = request.getParameter("pdffilename_input");
		String points = request.getParameter("points_input");
		boolean finalResult = false;
		try {
			//rowsUpdate = insertNewUser(email,password,firstName,lastName,birthDate);
			finalResult = insertNewSurveyReplies(survey_id,user_id,answers,pdfFileName,points);
		} catch (ClassNotFoundException | SQLException | IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if (finalResult == true) {
				request.getRequestDispatcher("surveyreplies.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("insertSurveyreplies.jsp").forward(request, response);
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private boolean insertNewSurveyReplies(String survey_id, String user_id, String answers, String pdfFileName,
			String points)
					throws ClassNotFoundException, SQLException, IOException, ParseException {
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
