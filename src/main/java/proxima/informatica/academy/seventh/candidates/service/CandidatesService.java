package proxima.informatica.academy.seventh.candidates.service;

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
import org.slf4j.LoggerFactory;

import proxima.informatica.academy.DatabaseManagerSingleton;
import proxima.informatica.academy.dto.AbstractCommonDto;
import proxima.informatica.academy.dto.CandidatesDto;
import proxima.informatica.academy.hibernate.CandidatesManager;

public class CandidatesService {

	private static CandidatesService instance;
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(CandidatesService.class);

	private CandidatesService() {
	}

	public static CandidatesService getInstance() {
		if (instance == null) {
			instance = new CandidatesService();
		}
		return instance;
	}
	
	public int insertSurveyreplies(CandidatesDto candidatesToInsert) {
		return CandidatesManager.insert(candidatesToInsert);
	}
	
	public List<AbstractCommonDto> selectAllCandidates() {
		return CandidatesManager.selectAll();
	}
	
	public void deleteCandidates(CandidatesDto candidatesToDelete) {
		CandidatesManager.delete(candidatesToDelete);
	}
	
	public CandidatesDto selectCandidatesById(int id) {
		return CandidatesManager.selectById(id);
	}
	
	public CandidatesDto updateCandidates(CandidatesDto item) {
		return (CandidatesDto) CandidatesManager.update(item);
	}
}
