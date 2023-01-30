package proxima.informatica.academy.seventh.surveyquestion.service;

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

import proxima.informatica.academy.DatabaseManagerSingleton;
import proxima.informatica.academy.dto.RoleDto;
import proxima.informatica.academy.dto.SurveyrepliesDto;
import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.hibernate.SurveyrepliesManager;

public class SurveyRepliesService {

	private static SurveyRepliesService instance;
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(SurveyRepliesService.class);

	private SurveyRepliesService() {
	}

	public static SurveyRepliesService getInstance() {
		if (instance == null) {
			instance = new SurveyRepliesService();
		}
		return instance;
	}
	
	public int insertSurveyreplies(SurveyrepliesDto surveyrepliesToInsert) {
		return SurveyrepliesManager.insert(surveyrepliesToInsert);
	}
	
	public List<SurveyrepliesDto> selectAllSurveyreplies() {
		return SurveyrepliesManager.selectAll();
	}
	
	public void deleteSurveyreplies(SurveyrepliesDto surveyrepliesToDelete) {
		SurveyrepliesManager.delete(surveyrepliesToDelete);
	}
	
	public SurveyrepliesDto selectSurveyrepliesById(int id) {
		return SurveyrepliesManager.selectById(id);
	}
	
	public SurveyrepliesDto updateSurveyReplies(SurveyrepliesDto item) {
		return (SurveyrepliesDto) SurveyrepliesManager.update(item);
	}
}
