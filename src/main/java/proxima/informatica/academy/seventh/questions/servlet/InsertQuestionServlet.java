package proxima.informatica.academy.seventh.questions.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.QuestionsDto;
import proxima.informatica.academy.hibernate.QuestionsManager;
import proxima.informatica.academy.seventh.role.servlet.InsertRoleServlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/InsertQuestionServlet")
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(InsertRoleServlet.class);
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
		int result = 0;
		
		QuestionsDto qs = new QuestionsDto();
		qs.setLabel(label);
		qs.setDescription(description);
		result = QuestionsManager.insert(qs);
		
		logger.debug("InsertQuestionServlet.DEBUG - responseValue: " + result);
		if (result > 0) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
