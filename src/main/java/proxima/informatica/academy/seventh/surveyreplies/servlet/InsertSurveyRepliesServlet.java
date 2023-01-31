package proxima.informatica.academy.seventh.surveyreplies.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyrepliesDto;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.hibernate.SurveyrepliesManager;
import proxima.informatica.academy.seventh.surveyreplies.service.SurveyRepliesService;

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
		int value = 0;
		try {
			//rowsUpdate = insertNewUser(email,password,firstName,lastName,birthDate);
			value = insertNewSurveyReplies(survey_id,user_id,answers,pdfFileName,points);
		} catch (ClassNotFoundException | SQLException | IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if (value > 0) {
				request.getRequestDispatcher("surveyreplies.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("insertSurveyreplies.jsp").forward(request, response);
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private int insertNewSurveyReplies(String survey_id, String user_id, String answers, String pdfFileName,
			String points)
					throws ClassNotFoundException, SQLException, IOException, ParseException {
		int value = 0;
		SurveyrepliesDto surveyRepliesToInsert = new SurveyrepliesDto();
		Timestamp SurveyRepliesInsertedTime = Timestamp.valueOf(LocalDateTime.now());
		BigInteger surveyid = new BigInteger(survey_id);
		BigInteger userid = new BigInteger(user_id);
		
		surveyRepliesToInsert.setSurvey_id(surveyid);
		surveyRepliesToInsert.setUser_id(userid);
		surveyRepliesToInsert.setStarttime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setEndtime(SurveyRepliesInsertedTime);
		surveyRepliesToInsert.setAnswers(answers);
		surveyRepliesToInsert.setPdffilename(pdfFileName);
		surveyRepliesToInsert.setPoints(points);
		
		value = SurveyRepliesService.getInstance().insertSurveyreplies(surveyRepliesToInsert);
		
		return value;
	}
}
