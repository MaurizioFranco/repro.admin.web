package proxima.informatica.academy.seventh.questions.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.QuestionsService;




/**
 * @author DaimCod
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteQuestionServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DeleteQuestionServlet.START");
		int idToCancel = Integer.parseInt(request.getParameter("selectedUserId"));
		boolean risposta = QuestionsService.getIstance().deleteById(idToCancel);
		
		logger.debug("DeleteRoleServlet.DEBUG - responseValue: " + risposta);
		if (risposta) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
