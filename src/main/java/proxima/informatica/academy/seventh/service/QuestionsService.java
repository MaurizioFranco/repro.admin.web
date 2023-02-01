package proxima.informatica.academy.seventh.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Questions;
import centauri.academy.proxima.cerepro.entity.EntityInterface;
import centauri.academy.proxima.cerepro.repository.QuestionsRepository;

/**
 * 
 * @author DaimCod
 *
 */
public class QuestionsService {
	private final static Logger logger = LoggerFactory.getLogger(QuestionsService.class);
	private QuestionsRepository questionRepository = new QuestionsRepository();
	private static QuestionsService instance;

	private QuestionsService() {
		
	}

	public static QuestionsService getIstance() {
		if (instance == null) {
			instance = new QuestionsService();
		}
		return instance;
	}
	
	public List<EntityInterface> selectAll(){	
		logger.debug("QuestionsService: selectAll - START");
		return questionRepository.findAll();
	}
	
	public Questions selectById(int id) {
		logger.debug("QuestionsService: Select by ID - START");
		Questions question = null;
		question = questionRepository.findById(id);
		logger.debug("QuestionsService: Select by ID - END");
		return question;
	}
	
	public boolean deleteById(int id) {
		boolean deleted = false;
		logger.debug("QuestionsService: Delete by ID - START");
		deleted = questionRepository.delete(id);
		logger.debug("QuestionsService: Delete by ID - END");
		return deleted;
	}
	
	public long insert(Questions question) {
		logger.debug("QuestionsService: INSERT - START");
		long idReturned = 0;
		idReturned = questionRepository.create(question);
		logger.debug("QuestionsService: INSERT - END");
		return idReturned;
	}
	
	public boolean updateQuestion(Questions qs) {
		logger.debug("QuestionsService: UPDATE - START");
		boolean resultObj = false;
		resultObj = questionRepository.update(qs);
		logger.debug("QuestionsService: UPDATE - END");
		if(resultObj == true)
			return resultObj;

		return resultObj;
	}

}
