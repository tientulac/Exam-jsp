package com.example.practical.controller;

import com.example.practical.entity.Brand;
import com.example.practical.entity.Phone;
import com.example.practical.repository.JpaRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

public class PhoneServlet extends HttpServlet {
    public static ArrayList<Brand> listBrand = new ArrayList<>();
    public static ArrayList<Phone> listPhone = new ArrayList<>();

    JpaRepository<Brand> jpaBrand = new JpaRepository<Brand>(Brand.class);
    JpaRepository<Phone> jpaPhone = new JpaRepository<Phone>(Phone.class);

    protected void  getAllData(HttpServletRequest req, HttpServletResponse resp) {
        listBrand = (ArrayList<Brand>) jpaBrand.findAll();
        listPhone = (ArrayList<Phone>) jpaPhone.findAll();

        req.setAttribute("listBrand", listBrand);
        req.setAttribute("listPhone", listPhone);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getAllData(req, resp);
        req.getRequestDispatcher("main/phone.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            boolean rs = false;

            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            int brandID = Integer.parseInt(req.getParameter("brandID"));

            Phone phone = new Phone(0, name, brandID, price, description);

            if (phone.isValid()) {
                rs = jpaPhone.save(phone);
                if (rs) {
                    getAllData(req, resp);
                    req.getRequestDispatcher("main/phone.jsp").forward(req, resp);
                } else {
                    resp.getWriter().println("Bad request");
                }
            } else {
                getAllData(req, resp);
                HashMap<String, String> errors = phone.getErrors();
                req.setAttribute("errors", errors);
                req.setAttribute("phone", phone);
                req.getRequestDispatcher("main/phone.jsp").forward(req, resp);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resp.getWriter().println(ex.getMessage());
        }
    }
}
