package proxima.informatica.academy.seventh.candidatestates.servlet;

import java.io.IOException;

import centauri.academy.proxima.cerepro.entity.CandidateStates;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidateStatesService;

/**
 * Servlet implementation class UpdateRoleServlet
 */

/**
 * @author MarcoFabretti
 */

public class UpdateCandidateStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCandidateStateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CandidateStates candidate = new CandidateStates();
		candidate.setId((long) Integer.parseInt(request.getParameter("id")));
		candidate.setRole_id((long) Integer.parseInt(request.getParameter("role_id")));
		candidate.setStatus_code(Integer.parseInt(request.getParameter("status_code")));
		candidate.setStatus_description(request.getParameter("status_description"));
		candidate.setStatus_label(request.getParameter("status_label"));
		candidate.setStatus_color(request.getParameter("status_color"));

		if(CandidateStatesService.getInstance().update(candidate)) {
			request.setAttribute("updateRole", "OK");
			request.getRequestDispatcher("role.jsp").forward(request, response); 
		}else {
			request.setAttribute("updateRole", "KO");
			request.getRequestDispatcher("role.jsp").forward(request, response); 
		}
	}

}
