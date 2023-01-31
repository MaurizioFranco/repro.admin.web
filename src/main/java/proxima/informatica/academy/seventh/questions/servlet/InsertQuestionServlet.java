package proxima.informatica.academy.seventh.questions.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.QuestionsDto;
import proxima.informatica.academy.hibernate.QuestionsManager;

import java.io.IOException;

/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/InsertQuestionServlet")
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		String label = request.getParameter("label");
		String description = request.getParameter("description");
		int result = 0;
		
		QuestionsDto qs = new QuestionsDto();
		qs.setLabel(label);
		qs.setDescription(description);
		result = QuestionsManager.insert(qs);
		
		if(result > 0) {
			request.setAttribute("insertConfirmed", true);
			request.getRequestDispatcher("./questions.jsp").forward(request, response);
		}
		else {
			request.setAttribute("insertConfirmed", false);
			request.getRequestDispatcher("./questions.jsp").forward(request, response);
		}
	}

}
