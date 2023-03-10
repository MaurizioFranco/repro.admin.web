package proxima.informatica.academy.seventh.surveyquestion.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyquestionsService;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysQuestions;

/**
 * 
 * @author Giacomo Della Luna
 *
 */


/**
 * Servlet implementation class GetSurveyquestionsServlet
 */
@WebServlet("/GetSurveyquestionsServlet")
public class GetSurveyquestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(GetSurveyquestionsServlet.class);

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSurveyquestionsServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetSurveyquestionsServlet.START");
		SurveysQuestions item = null ;
		try {
			String itemId = request.getParameter("sqId") ;
			logger.debug("GetSurveyquestionsServlet.DEBUG - roleId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = SurveyquestionsService.getInstance().selectById(itemIdInt);
			logger.debug("GetSurveyquestionsServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetSurveyquestionsServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
