package com.ntu.tienthinh.quanlyoto.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {
        
        // Giả lập tài khoản Admin công nghệ
        if ("admin".equals(username) && "123456".equals(password)) {
            session.setAttribute("userRole", "ADMIN");
            session.setAttribute("username", "Quản Trị Viên");
            return "redirect:/admin/appointments";
        } 
        // Giả lập tài khoản Khách hàng
        else if ("customer".equals(username) && "123456".equals(password)) {
            session.setAttribute("userRole", "CUSTOMER");
            session.setAttribute("username", username);
            return "redirect:/";
        }
        
        model.addAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Xóa sạch session khi đăng xuất
        return "redirect:/login";
    }
}