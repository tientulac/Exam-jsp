package com.example.practical.model;

import com.example.practical.entity.Brand;
import com.example.practical.repository.JpaRepository;

import java.util.ArrayList;

public class BrandModel implements IBrand {
    public static ArrayList<Brand> listBrand = new ArrayList<>();
    JpaRepository<Brand> jpaBrand = new JpaRepository<Brand>(Brand.class);

    @Override
    public ArrayList<Brand> findAll() {
        try {
            listBrand = (ArrayList<Brand>) jpaBrand.findAll();
            return listBrand;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
