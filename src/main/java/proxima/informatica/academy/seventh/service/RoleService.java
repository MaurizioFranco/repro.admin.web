package proxima.informatica.academy.seventh.service;

import java.util.ArrayList;
import java.util.List;

import centauri.academy.proxima.cerepro.entity.EntityInterface;
import centauri.academy.proxima.cerepro.entity.Roles;
import centauri.academy.proxima.cerepro.repository.RolesRepository;

public class RoleService {

	RolesRepository roleRepository = null ;
	
	private RoleService() {
		roleRepository = new RolesRepository () ; 
	}

	private static RoleService instance;

	public static RoleService getInstance() {
		if (instance == null) {
			instance = new RoleService();
		}
		return instance;
	}

	public boolean insert(Roles role) {
		boolean response = false;

		if (roleRepository.create(role) > 0)
			response = true;
		return response;
	}

	public Roles selectById(int id) {
		Roles roleRetrived = new Roles();
		roleRetrived = (Roles)roleRepository.findById((long)id);

		return roleRetrived;
	}

	public List<EntityInterface> getAllRoles() {
		return roleRepository.findAll();
	}

	public boolean updateRole(Roles role) {
		return roleRepository.update(role) ;
	}

	public boolean deleteRole(int id) {
		boolean response = false;

		if (roleRepository.delete(id))
			response = true;
		return response;
	}

}
