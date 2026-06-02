package com.ntu.tienthinh.quanlyoto.repository;

import com.ntu.tienthinh.quanlyoto.entity.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    
    // Tự động sinh câu lệnh truy vấn tìm lịch hẹn theo số điện thoại khách hàng
    List<Appointment> findByPhone(String phone);
}