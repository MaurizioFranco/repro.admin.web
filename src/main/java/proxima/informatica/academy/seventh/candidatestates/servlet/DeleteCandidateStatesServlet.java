package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.CandidateStatesDto;
import proxima.informatica.academy.dto.CandidatesDto;
import proxima.informatica.academy.hibernate.CandidateStatesManager;

/**
 * Servlet implementation class DeleteServlet
 */

@WebServlet("/DeleteCandidateStatesServlet")
public class DeleteCandidateStatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteCandidateStatesServlet.class);

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCandidateStatesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int candidateStatesId = Integer.parseInt(request.getParameter("candidateStatesId"));
		logger.debug("CandidateStates ID to delete: "+candidateStatesId);
		CandidateStatesDto delCan = new CandidateStatesDto();
		delCan.setId(candidateStatesId);
		
		
		boolean responseValue = CandidateStatesManager.delete(delCan);
			if (responseValue) {
				response.getWriter().append("OK");
				request.getRequestDispatcher("candidatestates.jsp").forward(request, response); 
			} else {
				response.getWriter().append("KO");
				request.getRequestDispatcher("candidatestates.jsp").forward(request, response);
			}
	}

}
