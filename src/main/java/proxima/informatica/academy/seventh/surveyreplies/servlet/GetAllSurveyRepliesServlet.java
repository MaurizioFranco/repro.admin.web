package proxima.informatica.academy.seventh.surveyreplies.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyRepliesService;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.EntityInterface;

/**
 * @author matteo.peruzza@gmail.com
 */

@WebServlet("/GetAllSurveyRepliesServlet")
public class GetAllSurveyRepliesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetAllSurveyRepliesServlet.class);

    public GetAllSurveyRepliesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	logger.debug("GetAllSurveyRepliesServlet.START");
	List<EntityInterface> items = null;
	try {
		items = SurveyRepliesService.getInstance().getAllSurveyReplies();
	} catch (Exception e) {
		logger.error(e.getMessage());
	}
	ObjectMapper mapper = new ObjectMapper();
	String [] itemsToJson = new String[items.size()];
	for (int i = 0; i < items.size(); i++) {
		logger.debug("GetAllSurveyRepliesServlet.DEBUG - item:" + items.get(i));
		itemsToJson[i] = mapper.writeValueAsString(items.get(i));
		logger.debug("GetAllSurveyRepliesServlet.DEBUG - jsonItem:" + itemsToJson[i]);
		response.getWriter().append(itemsToJson[i] + "\n");
		}
	logger.debug("GetAllSurveyRepliesServlet.END");

	}

}