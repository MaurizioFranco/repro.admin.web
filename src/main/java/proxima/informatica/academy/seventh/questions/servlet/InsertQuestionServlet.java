package proxima.informatica.academy.seventh.questions.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Questions;
import centauri.academy.proxima.cerepro.repository.QuestionsRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/InsertQuestionServlet")
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertQuestionServlet.class);
	private QuestionsRepository questionRepository = new QuestionsRepository();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("InsertQuestionServlet.START");
		String label = request.getParameter("label");
		String description = request.getParameter("description");
		long result = 0;
		
		Questions qs = new Questions();
		qs.setLabel(label);
		qs.setDescription(description);
		result = questionRepository.create(qs);
		
		logger.debug("InsertQuestionServlet.DEBUG - responseValue: " + result);
		if (result > 0) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
