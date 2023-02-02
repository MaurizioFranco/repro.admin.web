package proxima.informatica.academy.seventh.candidates;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.EntityInterface;

/**
 * @author matteo.peruzza@gmail.com
 */

@WebServlet("/GetAllCandidatesServlet")
public class GetAllCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(GetAllCandidatesServlet.class);

    public GetAllCandidatesServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	logger.debug("GetAllCandidatesServlet.START");
	List<EntityInterface> items = null;
	try {
		items = CandidatesService.getInstance().getAllCandidates();
	} catch (Exception e) {
		logger.error(e.getMessage());
	}
	ObjectMapper mapper = new ObjectMapper();
	String [] itemsToJson = new String[items.size()];
	for (int i = 0; i < items.size(); i++) {
		logger.debug("GetAllCandidatesServlet.DEBUG - item:" + items.get(i));
		itemsToJson[i] = mapper.writeValueAsString(items.get(i));
		logger.debug("GetAllCandidatesServlet.DEBUG - jsonItem:" + itemsToJson[i]);
		response.getWriter().append(itemsToJson[i] + "\n");
		}
	logger.debug("GetAllCandidatesServlet.END");

	}

}