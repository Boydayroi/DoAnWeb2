package com.ntu.tienthinh.quanlyoto.controller;

import com.ntu.tienthinh.quanlyoto.entity.Appointment;
import com.ntu.tienthinh.quanlyoto.entity.Car;
import com.ntu.tienthinh.quanlyoto.repository.AppointmentRepository;
import com.ntu.tienthinh.quanlyoto.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AppointmentRepository appointmentRepository;
    
    @Autowired
    private CarRepository carRepository;

    // CẬP NHẬT: Tính toán số liệu Dashboard Thống kê tự động nhảy số
    @GetMapping("/appointments")
    public String listAppointments(Model model) {
        List<Appointment> allAppointments = appointmentRepository.findAll();
        model.addAttribute("appointments", allAppointments);
        
        // Đếm dữ liệu thời gian thực
        model.addAttribute("totalCars", carRepository.count());
        model.addAttribute("totalAppointments", allAppointments.size());
        model.addAttribute("pendingAppointments", allAppointments.stream().filter(ap -> "PENDING".equals(ap.getStatus())).count());
        
        return "admin-appointments";
    }

    @GetMapping("/appointments/status")
    public String updateStatus(@RequestParam Long id, @RequestParam String status) {
        Appointment ap = appointmentRepository.findById(id).orElse(null);
        if (ap != null) {
            ap.setStatus(status);
            appointmentRepository.save(ap);
        }
        return "redirect:/admin/appointments";
    }

    @GetMapping("/cars")
    public String listCars(Model model) {
        model.addAttribute("cars", carRepository.findAll());
        return "admin-cars";
    }

    @GetMapping("/cars/add")
    public String showAddCarForm(Model model) {
        model.addAttribute("car", new Car());
        return "admin-car-form";
    }

    @PostMapping("/cars/save")
    public String saveCar(@ModelAttribute Car car) {
        carRepository.save(car);
        return "redirect:/admin/cars";
    }
}