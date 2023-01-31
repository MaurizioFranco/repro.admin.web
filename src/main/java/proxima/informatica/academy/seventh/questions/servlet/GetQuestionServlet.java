package proxima.informatica.academy.seventh.questions.servlet;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Questions;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.QuestionsService;

/**
 * Servlet implementation class GetQuestionServlet
 */
@WebServlet("/GetQuestionServlet")
public class GetQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(GetQuestionServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	logger.debug("GetQuestionServlet.START");
		Questions item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug("GetQuestionServlet.DEBUG - roleId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = QuestionsService.getIstance().selectById(itemIdInt);
			logger.debug("GetQuestionServlet.DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug("GetQuestionServlet.DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
