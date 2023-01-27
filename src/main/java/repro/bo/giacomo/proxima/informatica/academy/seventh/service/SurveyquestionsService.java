package repro.bo.giacomo.proxima.informatica.academy.seventh.service;

import java.util.ArrayList;
import java.util.List;

import proxima.informatica.academy.dto.SurveyquestionsDto;
import proxima.informatica.academy.hibernate.SurveyquestionsManager;

public class SurveyquestionsService {

	private SurveyquestionsService() {
	}

	private static SurveyquestionsService instance;

	public static SurveyquestionsService getInstance() {
		if (instance == null) {
			instance = new SurveyquestionsService();
		}
		return instance;
	}

	public boolean insert(SurveyquestionsDto sq) {
		boolean response = false;

		if (SurveyquestionsManager.insert(sq) > 0)
			response = true;
		return response;
	}

	public SurveyquestionsDto selectById(int id) {
		SurveyquestionsDto sqRetrived = new SurveyquestionsDto();
		sqRetrived = SurveyquestionsManager.selectById(id);

		return sqRetrived;
	}

	public List<SurveyquestionsDto> getAllSurveyquestions() {
		List<SurveyquestionsDto> listSq = new ArrayList<SurveyquestionsDto>();

		listSq = SurveyquestionsManager.selectAll();

		return listSq;
	}

	public boolean deleteSurveyquestion(SurveyquestionsDto sq) {
		boolean result = false;
		SurveyquestionsManager.delete(sq);
		if(SurveyquestionsManager.selectById(sq.getId()) == null)
			result = true;
		return result;
	}
}
