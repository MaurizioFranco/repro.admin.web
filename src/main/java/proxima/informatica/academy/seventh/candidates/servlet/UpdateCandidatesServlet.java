package proxima.informatica.academy.seventh.candidates.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.CandidatesDto;
import proxima.informatica.academy.seventh.candidates.service.CandidatesService;


/**
 * Servlet implementation class DeleteUserService
 */
@WebServlet("/UpdateCandidatesServlet")
public class UpdateCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdateCandidatesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCandidatesServlet() {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idSelected = request.getParameter("id_input");
		logger.debug(idSelected);
		int id = Integer.parseInt(idSelected);
		int result = 0;
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
		
		try {
			result = updateCandidates(id, user_id, course_code, candidacy_date_time, firstname,
					lastname, email, inserted_by, candidate_state_code);
			logger.debug("result = "+result);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {	
			request.setAttribute("updateSurevyreplies","OK");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
		}else {
			request.setAttribute("updateSurveyreplies","KO");
			request.getRequestDispatcher("surveyreplies.jsp").forward(request,response);
		}
		
		//request.getRequestDispatcher("users.jsp").forward(request,response);
	}
	
	private int updateCandidates(Integer id, Integer user_id, String course_code, LocalDateTime candidacy_date_time, String firstname,
			String lastname, String email, Integer inserted_by, Integer candidate_state_code) throws ClassNotFoundException, SQLException, IOException {
		int value = 0;
		CandidatesDto candidatesToInsert = CandidatesService.getInstance().selectCandidatesById(id);
		Timestamp regdate = Timestamp.valueOf(LocalDateTime.now());
		
		candidatesToInsert.setUser_id(id);
		candidatesToInsert.setUser_id(user_id);
		candidatesToInsert.setCourse_code(course_code);
		candidatesToInsert.setCandidacy_date_time(candidacy_date_time);
		candidatesToInsert.setFirstname(firstname);
		candidatesToInsert.setLastname(lastname);
		candidatesToInsert.setEmail(email);
		candidatesToInsert.setRegdate(regdate);
		candidatesToInsert.setInserted_by(inserted_by);
		candidatesToInsert.setCandidate_state_code(candidate_state_code);
		if(CandidatesService.getInstance().updateCandidates(candidatesToInsert)!= null) {
			value = 1;
		}
		return value;
	}
}
