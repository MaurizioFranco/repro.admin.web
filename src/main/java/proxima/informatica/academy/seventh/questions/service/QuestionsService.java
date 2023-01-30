package proxima.informatica.academy.seventh.questions.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import proxima.informatica.academy.dto.QuestionsDto;
import proxima.informatica.academy.hibernate.QuestionsManager;

public class QuestionsService {
	private final static Logger logger = LoggerFactory.getLogger(QuestionsManager.class);
	
	private static QuestionsService instance;

	private QuestionsService() {
		
	}

	public static QuestionsService getIstance() {
		if (instance == null) {
			instance = new QuestionsService();
		}
		return instance;
	}
	
	public List<QuestionsDto> selectAll(){
		List<QuestionsDto> listQuestions = null;
		logger.debug("QuestionsService: selectAll - START");
		listQuestions = QuestionsManager.selectAll();
		logger.debug("QuestionsService: selectAll - LIST SIZE: " + listQuestions.size());
		return listQuestions;
	}
	
	public QuestionsDto selectById(int id) {
		logger.debug("QuestionsService: Select by ID - START");
		QuestionsDto question = null;
		question = QuestionsManager.selectById(id);
		logger.debug("QuestionsService: Select by ID - END");
		return question;
	}
	
	public boolean deleteById(int id) {
		boolean deleted = false;
		logger.debug("QuestionsService: Delete by ID - START");
		deleted = QuestionsManager.deleteById(id);
		logger.debug("QuestionsService: Delete by ID - END");
		return deleted;
	}
	
	public int insert(QuestionsDto question) {
		logger.debug("QuestionsService: INSERT - START");
		int idReturned = 0;
		idReturned = QuestionsManager.insert(question);
		logger.debug("QuestionsService: INSERT - END");
		return idReturned;
	}

}
