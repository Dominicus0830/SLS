package org.domi.Controller;

import java.io.PrintWriter;
import java.sql.Blob;

import javax.servlet.http.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import org.domi.Service.*;
import org.domi.DTO.*;
import org.domi.Exception.*;
import org.domi.DAO.*;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	// 관리자 로그아웃
	@GetMapping("/logout")
	public String member_logout(final HttpSession session) {
		if (session.getAttribute("loginMemberName") != null)
			session.removeAttribute("loginMemberName");

		session.invalidate();

		return "redirect:/";
	}
}
