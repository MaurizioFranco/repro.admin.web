package proxima.informatica.academy.seventh.candidatestates.service;

import java.util.ArrayList;
import java.util.List;

import proxima.informatica.academy.dto.CandidateStatesDto;
import proxima.informatica.academy.hibernate.CandidateStatesManager;

public class CandidateStatesService {

	private CandidateStatesService() {
	}

	private static CandidateStatesService instance;

	public static CandidateStatesService getInstance() {
		if (instance == null) {
			instance = new CandidateStatesService();
		}
		return instance;
	}
	
	public boolean updateCandidateStates(CandidateStatesDto candidate) {
		boolean response = false;

		if (CandidateStatesManager.update(candidate) != null)
			response = true;

		return response;
	}



	public static boolean insert(CandidateStatesDto candidate) {
		boolean response = false;

		if (CandidateStatesManager.insert(candidate)>1)
			response = true;
		return response;
	}
	
	public static CandidateStatesDto selectById(int id) {
		CandidateStatesDto candidateRetrived = new CandidateStatesDto();
		candidateRetrived = CandidateStatesManager.selectById(id);

		return candidateRetrived;
	}

	public static List<CandidateStatesDto> getAllRoles() {
		List<CandidateStatesDto> listRoles = new ArrayList<CandidateStatesDto>();

		listRoles = CandidateStatesManager.selectAll();

		return listRoles;
	}
	
	public static boolean delete(CandidateStatesDto candidate) throws ClassNotFoundException {
		boolean response = false;

		if (CandidateStatesManager.delete(candidate))
			response = true;

		return response;
	}
	
	public static List<CandidateStatesDto> selectAll() throws ClassNotFoundException {
		List<CandidateStatesDto> candidates= CandidateStatesManager.selectAll();
			return candidates;
	}

	public static boolean update(CandidateStatesDto candidate) {
		boolean response = false;

		if (CandidateStatesManager.update(candidate) != null)
			response = true;

		return response;
	}

}
