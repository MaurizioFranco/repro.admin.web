package proxima.informatica.academy.seventh.candidates.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.CandidatesDto;
import proxima.informatica.academy.hibernate.CandidatesManager;
import proxima.informatica.academy.seventh.candidates.service.CandidatesService;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Servlet implementation class DeleteUserService
 */
@WebServlet("/DeleteCandidatesServlet")
public class DeleteCandidatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteCandidatesServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCandidatesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idSelected = request.getParameter("selectedSurveyrepliesId");
		int id = Integer.parseInt(idSelected);
		boolean result = false;
		logger.debug("sto eliminando");
		
		try {
			result = deleteRowCandidates(id);
			logger.debug("result = "+result);
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result == true) {
			request.setAttribute("deleteCandidates","OK");
			request.getRequestDispatcher("candidates.jsp").forward(request,response);
		}else {
			request.setAttribute("deleteCandidates","KO");
			request.getRequestDispatcher("candidates.jsp").forward(request,response);
		}
	}
	
	private boolean deleteRowCandidates(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		CandidatesDto candidates = CandidatesManager.selectById(id);
		logger.debug("" + candidates);
		CandidatesService.getInstance().deleteCandidates(candidates);
		if(CandidatesService.getInstance().selectCandidatesById(id) == null) {
			value = true;
		}
		return value;
	}

}
