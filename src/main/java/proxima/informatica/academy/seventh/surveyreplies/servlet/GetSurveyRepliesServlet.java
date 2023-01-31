package proxima.informatica.academy.seventh.surveyreplies.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyRepliesService;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysReplies;


/**
 * Servlet implementation class getSurveyReplies
 * @author Giammarco Lucchetti
 */
@WebServlet("/GetSurveyRepliesServlet")
public class GetSurveyRepliesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(GetSurveyRepliesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSurveyRepliesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetSurveyRepliesServlet.START");
		SurveysReplies item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetSurveyrepliesServlet.DEBUG - roleId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = SurveyRepliesService.getInstance().selectSurveyrepliesById(itemIdInt);
			logger.debug("GetSurveyrepliesServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetSurveyrepliesServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}
}
