package proxima.informatica.academy.seventh.user.service;

import java.util.ArrayList;
import java.util.List;

import org.proxima.common.mail.MailUtility;

import proxima.informatica.academy.dto.UserDto;
import proxima.informatica.academy.hibernate.UserManager;
import proxima.informatica.academy.seventh.user.result.LoginResult;

public class UserService {

	private final String USER_EMAIL = "dllgiacomo@gmail.com";

	private UserService() {
	}

	private static UserService instance;

	public static UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public LoginResult login(String email, String password) {
		LoginResult result = new LoginResult();
		UserDto user = new UserDto();
		user = UserManager.findByEmail(email);

		if (user == null) {
			result.setLoginResponse(false);
			result.setLoginMessage("Email not found");
		} else if (user.getPassword() == null) {
			result.setLoginResponse(false);
			result.setLoginMessage("Password not found");
		} else if (!user.getPassword().equals(password)) {
			result.setLoginResponse(false);
			result.setLoginMessage("Password wrong");
		} else if (user.getEnabled() == false) {
			result.setLoginResponse(false);
			result.setLoginMessage("Account not activated");
		} else {
			result.setLoginResponse(true);
			result.setLoginMessage("Welcome");
		}
		return result;
	}

	public boolean insert(UserDto user) {
		boolean response = false;

		try {
			if (UserManager.insert(user) > 0) {
				UserDto userForId = UserManager.findByEmail(user.getEmail());
				MailUtility.sendSimpleMail(USER_EMAIL, "Create a new password",
						"Click <a href='http://localhost:8080/repro.admin.web/completeRegistration.jsp?id="
								+ userForId.getId() + "'>here</a> to complete your registration");

				response = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return response;
	}

	public UserDto selectById(int id) {
		UserDto userRetrived = new UserDto();
		userRetrived = UserManager.selectById(id);

		return userRetrived;
	}

	public List<UserDto> getAllUsers() {
		List<UserDto> listUsers = new ArrayList<UserDto>();

		listUsers = UserManager.selectAll();

		return listUsers;
	}

	public List<UserDto> getAllUsersByRole() {
		List<UserDto> listUsers = new ArrayList<UserDto>();

		listUsers = UserManager.findByRole();

		return listUsers;
	}

	public boolean updateUser(UserDto user) {
		boolean response = false;

		if (UserManager.update(user))
			response = true;

		return response;
	}

	public boolean deleteUser(int id) {
		boolean response = false;

		if (UserManager.deleteById(id, UserDto.class))
			response = true;

		return response;
	}

}
