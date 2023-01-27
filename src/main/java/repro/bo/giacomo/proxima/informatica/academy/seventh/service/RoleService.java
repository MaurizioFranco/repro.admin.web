package repro.bo.giacomo.proxima.informatica.academy.seventh.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import proxima.informatica.academy.DatabaseManagerSingleton;
import proxima.informatica.academy.dto.RoleDto;
import proxima.informatica.academy.hibernate.RoleManager;

public class RoleService {

	private RoleService() {
	}

	private static RoleService instance;

	public static RoleService getInstance() {
		if (instance == null) {
			instance = new RoleService();
		}
		return instance;
	}


	public boolean insert(RoleDto role) {
		boolean response = false;

		if (DatabaseManagerSingleton.getInstance().insertRole(role) > 0)
			response = true;
		return response;
	}
	
	public RoleDto selectById(int id) {
		RoleDto roleRetrived = new RoleDto();
		roleRetrived = DatabaseManagerSingleton.getInstance().selectByRoleId(id);

		return roleRetrived;
	}

	public List<RoleDto> getAllRoles() {
		List<RoleDto> listRoles = new ArrayList<RoleDto>();

		listRoles = DatabaseManagerSingleton.getInstance().selectAllRoles();

		return listRoles;
	}

	public boolean updateRole(RoleDto role) {
		boolean response = false;

		if (DatabaseManagerSingleton.getInstance().updateRole(role.getId(), role) > 0)
			response = true;

		return response;
	}

	public boolean deleteRole(int id) {
		boolean response = false;

		try {
			if (DatabaseManagerSingleton.getInstance().deleteRowRoles(id))
				response = true;
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return response;
	}

}
