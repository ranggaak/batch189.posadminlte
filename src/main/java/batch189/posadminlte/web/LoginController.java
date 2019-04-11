package batch189.posadminlte.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Awiyanto Ajisasongko
 *
 */
@Controller
public class LoginController {
	@RequestMapping("/login")
	public String loginForm() {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.invalidate();
		return "login";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if ((username!=null) && username.equals("admin")) {
			if ((password!=null) && password.equals("admin")) {
				HttpSession session = req.getSession(true);
				session.setAttribute("nama", username);
//				session.setAttribute("userrole", "ADMIN");
				return "home";
			}
		}
		return "login";
	}
}