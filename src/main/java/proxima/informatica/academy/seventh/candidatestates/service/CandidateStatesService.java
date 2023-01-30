package proxima.informatica.academy.seventh.candidatestates.service;

import java.io.IOException;
import java.sql.SQLException;
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


	public boolean insert(CandidateStatesDto candidate) {
		boolean response = false;

		if (CandidateStatesManager.insert(candidate)>1)
			response = true;
		return response;
	}
	
	public CandidateStatesDto selectById(int id) {
		CandidateStatesDto candidateRetrived = new CandidateStatesDto();
		candidateRetrived = CandidateStatesManager.selectById(id);

		return candidateRetrived;
	}

	public List<CandidateStatesDto> getAllRoles() {
		List<CandidateStatesDto> listRoles = new ArrayList<CandidateStatesDto>();

		listRoles = CandidateStatesManager.selectAll();

		return listRoles;
	}
	
	public boolean delete(CandidateStatesDto candidate) throws ClassNotFoundException {
		boolean response = false;

		if (CandidateStatesManager.delete(candidate))
			response = true;

		return response;
	}
	
	public List<CandidateStatesDto> selectAll() throws ClassNotFoundException {
		List<CandidateStatesDto> candidates= CandidateStatesManager.selectAll();
			return candidates;
	}

}
