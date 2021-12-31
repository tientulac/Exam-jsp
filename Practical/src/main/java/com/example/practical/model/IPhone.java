package com.example.practical.model;

import com.example.practical.entity.Phone;

import java.util.ArrayList;

public interface IPhone {
    ArrayList<Phone> findAll();
    boolean save(Phone phone);
}
