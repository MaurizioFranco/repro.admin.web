package proxima.informatica.academy.seventh.service;

import java.util.List;

import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.EntityInterface;
import centauri.academy.proxima.cerepro.entity.Candidates;
import centauri.academy.proxima.cerepro.repository.CandidatesRepository;

public class CandidatesService {

	private static CandidatesService instance;
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(CandidatesService.class);

	private CandidatesRepository candidatesRepository;
	
	private CandidatesService() {
		candidatesRepository = new CandidatesRepository();
	}

	public static CandidatesService getInstance() {
		if (instance == null) {
			instance = new CandidatesService();
		}
		return instance;
	}
	
	public boolean insertCandidates(Candidates candidatesToInsert) {
		boolean response = false;
		if(candidatesRepository.create(candidatesToInsert)>1) {
			response = true;
		}
		return response;
	}
	
//	public List<Candidates> selectAllCandidates() {
//		return candidatesRepository.selectAll();
//	}
	public List<EntityInterface> getAllCandidates() {
		return candidatesRepository.findAll();
	}
	
	public void deleteCandidates(Candidates candidatesToDelete) {
		candidatesRepository.delete(candidatesToDelete.getId());
	}
	
	public Candidates selectCandidatesById(int id) {
		return candidatesRepository.findById(id);
	}
	
	public boolean updateCandidates(Candidates item) {
		return candidatesRepository.update(item);
	}
}
