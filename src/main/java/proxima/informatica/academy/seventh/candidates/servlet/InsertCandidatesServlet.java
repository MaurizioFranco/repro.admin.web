package proxima.informatica.academy.seventh.candidates.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.CandidatesDto;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.hibernate.CandidatesManager;
import proxima.informatica.academy.seventh.candidates.service.CandidatesService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/InsertCandidatesServlet")
public class InsertCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertCandidatesServlet.class);

	/**
	 * Default constructor.
	 */
	public InsertCandidatesServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer user_id = Integer.parseInt(request.getParameter("user_id"));
		String course_code = request.getParameter("course_code");
		
		String candidacy_date_time_string = request.getParameter("candidacy_date_time");
		LocalDateTime candidacy_date_time = LocalDateTime.parse(candidacy_date_time_string, DateTimeFormatter.ISO_DATE_TIME);
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		Integer inserted_by = Integer.parseInt(request.getParameter("inserted_by"));
		Integer candidate_state_code = Integer.parseInt(request.getParameter("candidate_state_code"));
		
		/*private Integer user_id;
		private String domicile_city;
		private String study_qualification;
		private Byte graduate;
		private Byte high_graduate;
		private Byte still_high_study;
		private String mobile;
		private String cv_external_path;
		private String course_code;
		private LocalDateTime candidacy_date_time;
		private String label;
		private String firstname;
		private String lastname;
		private String email;
		private Long dateofbirth;
		private Timestamp regdate;
		private String technical_note;
		private String hr_note;
		private Integer inserted_by;
		private String imgpath;
		private Integer candidate_state_code;*/
		
		int value = 0;
		try {
			//rowsUpdate = insertNewUser(email,password,firstName,lastName,birthDate);
			value = insertCandidates(user_id, course_code, candidacy_date_time, firstname,
					lastname, email, inserted_by, candidate_state_code);
		} catch (ClassNotFoundException | SQLException | IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			if (value > 0) {
				request.getRequestDispatcher("c.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("insertCandidates.jsp").forward(request, response);
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private int insertCandidates(Integer user_id, String course_code, LocalDateTime candidacy_date_time, String firstname,
			String lastname, String email, Integer inserted_by, Integer candidate_state_code)
					throws ClassNotFoundException, SQLException, IOException, ParseException {
		int value = 0;
		CandidatesDto candidatesToInsert = new CandidatesDto();
		Timestamp regdate = Timestamp.valueOf(LocalDateTime.now());
		
		candidatesToInsert.setUser_id(user_id);
		candidatesToInsert.setCourse_code(course_code);
		candidatesToInsert.setCandidacy_date_time(candidacy_date_time);
		candidatesToInsert.setFirstname(firstname);
		candidatesToInsert.setLastname(lastname);
		candidatesToInsert.setEmail(email);
		candidatesToInsert.setRegdate(regdate);
		candidatesToInsert.setInserted_by(inserted_by);
		candidatesToInsert.setCandidate_state_code(candidate_state_code);
		
		value = CandidatesService.getInstance().insertSurveyreplies(candidatesToInsert);
		
		return value;
	}
}
