package com.example.practical;

import com.example.practical.entity.Phone;
import com.example.practical.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public class MainThread {
    public static void main(String[] args) {
        List<Phone> listPhone = new ArrayList<>();
        JpaRepository<Phone> jpaPhone = new JpaRepository<Phone>(Phone.class);
        listPhone = (ArrayList<Phone>) jpaPhone.findAll();

        for (Phone _phone : listPhone)
        {
            System.out.println(_phone.getPhoneID());
            System.out.println(_phone.getName());
        }
    }
}
