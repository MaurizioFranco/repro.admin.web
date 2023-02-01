package proxima.informatica.academy.seventh.questions.servlet;

import java.io.IOException;

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
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/InsertQuestionServlet")
public class InsertQuestionServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(InsertQuestionServlet.class);
		
	/**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("InsertQuestionServlet.START");
		
		Questions qs = new Questions();
		qs.setLabel(request.getParameter("label"));
		qs.setDescription(request.getParameter("description"));
		boolean responseValue = QuestionsService.getIstance().insert(qs);
		
		logger.debug("InsertQuestionServlet.DEBUG - responseValue: " + responseValue);
		
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}
}
