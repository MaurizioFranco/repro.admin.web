package proxima.informatica.academy.seventh.questions.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.QuestionsDto;
import proxima.informatica.academy.seventh.questions.service.QuestionsService;
import proxima.informatica.academy.seventh.role.servlet.UpdateRoleServlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class UpdateQuestionServlet
 */
@WebServlet("/UpdateQuestionServlet")
public class UpdateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(UpdateRoleServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestionServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("UpdateQuestionServlet.START - " + request.getQueryString());
		int id = Integer.parseInt(request.getParameter("id"));
		String label = request.getParameter("label");
		String description = request.getParameter("description");
		
		QuestionsDto qs = new QuestionsDto();
		qs.setId(id);
		qs.setLabel(label);
		qs.setDescription(description);
		
		boolean responseValue = QuestionsService.getIstance().updateQuestion(qs);
		logger.debug("InsertQuestionServlet.DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
