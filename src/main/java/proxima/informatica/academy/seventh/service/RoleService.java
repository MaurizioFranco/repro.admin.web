package proxima.informatica.academy.seventh.service;

import java.util.List;

import javax.inject.Inject;

import centauri.academy.proxima.cerepro.entity.EntityInterface;
import centauri.academy.proxima.cerepro.entity.Roles;
import centauri.academy.proxima.cerepro.repository.RolesRepository;

public class RoleService {

	@Inject
	RolesRepository repository ;
	
	private RoleService() {
//		roleRepository = new RolesRepository () ; 
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

		if (repository.create(role) > 0)
			response = true;
		return response;
	}

	public Roles selectById(int id) {
		Roles roleRetrived = new Roles();
		roleRetrived = (Roles)repository.findById((long)id);

		return roleRetrived;
	}

	public List<EntityInterface> getAllRoles() {
		return repository.findAll();
	}

	public boolean updateRole(Roles role) {
		return repository.update(role) ;
	}

	public boolean deleteById(int id) {
		return repository.delete(id) ;
	}

}
