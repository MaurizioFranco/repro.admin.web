package proxima.informatica.academy.seventh.questions.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.QuestionsService;
import proxima.informatica.academy.seventh.service.RoleService;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.EntityInterface;

/**
 * @author matteo.peruzza@gmail.com
 */

@WebServlet("/GetAllQuestionsServlet")
public class GetAllQuestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetAllQuestionsServlet.class);

    public GetAllQuestionsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		logger.debug("GetAllQuestionsServlet.START");
		List<EntityInterface> items = null;
		try {
			items = QuestionsService.getIstance().selectAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		ObjectMapper mapper = new ObjectMapper();	
		String jsonResponse = mapper.writeValueAsString(items);
		response.getWriter().append(jsonResponse);
		logger.debug("GetAllQuestionsServlet.END");

	}

}