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
 * @author DaimCod
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	logger.debug(this.getClass().getSimpleName() + ".doGet - START");
		Questions item = null ;
		try {
			String itemId = request.getParameter("id") ;
			logger.debug(this.getClass().getSimpleName() + ".doGet - DEBUG - itemId: " + itemId);
			int itemIdInt = Integer.parseInt(itemId);
			item = QuestionsService.getIstance().selectById(itemIdInt);
			logger.debug(this.getClass().getSimpleName() + ".doGet - DEBUG - retrieving item: " + item);
		} catch (Exception e) {
			logger.error(this.getClass().getSimpleName() + ".doGet - ERROR" + e.getMessage());
			logger.error(e.getMessage(), e);
		}
		ObjectMapper mapper = new ObjectMapper();
		String itemToJson = mapper.writeValueAsString(item);
		logger.debug(this.getClass().getSimpleName() + ".doGet - DEBUG - returning itemToJson: " + itemToJson);
		response.getWriter().append(itemToJson);
    }

}
