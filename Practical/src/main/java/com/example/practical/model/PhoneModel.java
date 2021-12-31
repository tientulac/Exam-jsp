package com.example.practical.model;

import com.example.practical.entity.Phone;
import com.example.practical.repository.JpaRepository;

import java.util.ArrayList;

public class PhoneModel implements IPhone {

    public static ArrayList<Phone> listPhone = new ArrayList<>();
    JpaRepository<Phone> jpaPhone = new JpaRepository<Phone>(Phone.class);

    @Override
    public ArrayList<Phone> findAll() {
        try {
            listPhone = (ArrayList<Phone>) jpaPhone.findAll();
            return listPhone;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean save(Phone phone) {
        return false;
    }
}
