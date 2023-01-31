package proxima.informatica.academy.seventh.surveyquestion.surveyServlets;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.RoleDto;
import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.seventh.role.service.RoleService;
import proxima.informatica.academy.seventh.role.servlet.GetRoleServlet;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyService;

/**
 * 
 * @author Matteo Peruzza
 *
 */

@WebServlet("/GetSurveyServlet")
public class GetSurveyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	private final static Logger logger = LoggerFactory.getLogger(GetSurveyServlet.class);
	
	public GetSurveyServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("GetSurveyServlet.START");
		SurveyDto item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetSurveyServlet.DEBUG - surveyId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = SurveyService.getInstance().selectSurveyById(itemIdInt);
			logger.debug("GetSurveyServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetSurveyServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
	}
	
}
