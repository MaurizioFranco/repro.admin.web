package proxima.informatica.academy.seventh.candidates;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.CandidatesService;

import java.io.IOException;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Candidates;
import centauri.academy.proxima.cerepro.repository.CandidatesRepository;

/**
 * @author AntoIannaccone
 */

@WebServlet("/DeleteCandidates")
public class DeleteCandidatesServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(DeleteCandidatesServlet.class);
       
    public DeleteCandidatesServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug(this.getClass().getSimpleName() + ".START");
		int id = Integer.parseInt(request.getParameter("id"));
		
		boolean responseValue = CandidatesService.getInstance().deleteById(id) ;
        logger.debug(this.getClass().getSimpleName() + ".DEBUG - responseValue: " + responseValue);
		if (responseValue) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}