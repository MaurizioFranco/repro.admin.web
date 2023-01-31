package proxima.informatica.academy.seventh.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.proxima.common.mail.MailUtility;
//import org.proxima.common.mail.MailUtility;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.SurveysReplies;
import centauri.academy.proxima.cerepro.repository.SurveyRepliesRepository;

public class SurveyRepliesService {

	private static SurveyRepliesService instance;
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(SurveyRepliesService.class);

	private SurveyRepliesRepository surveyRepliesRepository;
	
	private SurveyRepliesService() {
		surveyRepliesRepository = new SurveyRepliesRepository();
	}

	public static SurveyRepliesService getInstance() {
		if (instance == null) {
			instance = new SurveyRepliesService();
		}
		return instance;
	}
	
	public boolean insertSurveyreplies(SurveysReplies surveyrepliesToInsert) {
		boolean response = false;
		if(surveyRepliesRepository.create(surveyrepliesToInsert)>1) {
			response = true;
		}
		return response;
	}
	
//	public List<SurveyReplies> selectAllSurveyreplies() {
//		return surveyRepliesRepository.selectAll();
//	}
	
	public void deleteSurveyreplies(SurveysReplies surveyrepliesToDelete) {
		surveyRepliesRepository.delete(surveyrepliesToDelete.getId());
	}
	
	public SurveysReplies selectSurveyrepliesById(int id) {
		return surveyRepliesRepository.findById(id);
	}
	
	public boolean updateSurveyReplies(SurveysReplies item) {
		return surveyRepliesRepository.update(item);
	}
}
