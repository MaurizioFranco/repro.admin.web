package proxima.informatica.academy.seventh.surveyquestion.service;

import java.util.List;

import proxima.informatica.academy.dto.SurveyDto;
import proxima.informatica.academy.hibernate.SurveyManager;

public class SurveyService {

	private static SurveyService instance;
	
	private SurveyService() {
	}
	
	public static SurveyService getInstance() {
		if(instance == null) {
			instance = new SurveyService();
		}
		return instance;
	}
	
	public int insertSurvey(SurveyDto surveyToInsert) {
		return SurveyManager.insert(surveyToInsert);
	}
	
	public List<SurveyDto> selectAllSurveys() {
		return SurveyManager.selectAll();
	}
	
	public void deleteSurvey(SurveyDto surveyToDelete) {
		SurveyManager.delete(surveyToDelete);
	}
	
	public SurveyDto selectSurveyById(int id) {
		return SurveyManager.selectById(id);
	}
	
	public SurveyDto updateSurvey(SurveyDto survey) {
		return SurveyManager.update(survey);
	}
}