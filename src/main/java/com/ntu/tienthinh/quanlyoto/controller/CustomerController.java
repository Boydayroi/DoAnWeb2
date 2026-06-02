package com.ntu.tienthinh.quanlyoto.controller;

import com.ntu.tienthinh.quanlyoto.entity.Appointment;
import com.ntu.tienthinh.quanlyoto.repository.AppointmentRepository;
import com.ntu.tienthinh.quanlyoto.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerController {
    
    @Autowired
    private CarRepository carRepository;
    
    @Autowired
    private AppointmentRepository appointmentRepository;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("cars", carRepository.findAll());
        return "index";
    }

    @GetMapping("/booking/{carId}")
    public String showBookingForm(@PathVariable Long carId, Model model) {
        model.addAttribute("car", carRepository.findById(carId).orElse(null));
        model.addAttribute("appointment", new Appointment());
        return "booking";
    }

    @PostMapping("/booking/save")
    public String saveBooking(@ModelAttribute Appointment appointment, @RequestParam Long carId) {
        appointment.setCar(carRepository.findById(carId).orElse(null));
        appointmentRepository.save(appointment);
        return "redirect:/?success";
    }

    // CHỨC NĂNG MỚI: Tiếp nhận số điện thoại và trả về danh sách lịch sử tương ứng
    @GetMapping("/my-history")
    public String showHistory(@RequestParam(required = false) String phone, Model model) {
        if (phone != null && !phone.isEmpty()) {
            model.addAttribute("myAppointments", appointmentRepository.findByPhone(phone));
            model.addAttribute("searchedPhone", phone);
        }
        return "history";
    }
}