package proxima.informatica.academy.seventh.role.service;

import java.util.ArrayList;
import java.util.List;

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

		if (RoleManager.insert(role) > 0)
			response = true;
		return response;
	}

	public RoleDto selectById(int id) {
		RoleDto roleRetrived = new RoleDto();
		roleRetrived = RoleManager.selectById(id);

		return roleRetrived;
	}

	public List<RoleDto> getAllRoles() {
		List<RoleDto> listRoles = new ArrayList<RoleDto>();

		listRoles = RoleManager.selectAll();

		return listRoles;
	}

	public boolean updateRole(RoleDto role) {
		boolean response = false;

		if (RoleManager.update(role) != null)
			response = true;

		return response;
	}

	public boolean deleteRole(int id) {
		boolean response = false;

		if (RoleManager.deleteById(id, RoleDto.class))
			response = true;
		return response;
	}

}
