package proxima.informatica.academy.seventh.questions.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.questions.service.QuestionsService;


/**
 * @author DaimCod
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idToCancel = Integer.parseInt(request.getParameter("selectedUserId"));
		boolean risposta = QuestionsService.getIstance().deleteById(idToCancel);
		
		if(risposta) {
			request.setAttribute("deleteConfirmed", risposta);
			request.getRequestDispatcher("./questions.jsp").forward(request, response);
		}
		else {
			
			request.getRequestDispatcher("./questions.jsp").forward(request, response);
		}
	}

}
