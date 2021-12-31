package com.example.practical.entity;

import com.example.practical.annotation.Column;
import com.example.practical.annotation.Entity;
import com.example.practical.annotation.Id;
import com.example.practical.util.SQLDataTypes;

import java.util.HashMap;

@Entity(tableName = "phone")
public class Phone {
    @Id(autoIncrement = true)
    @Column(columnName = "PhoneID", columnType = SQLDataTypes.INTEGER)
    private int PhoneID;
    @Column(columnName = "Name", columnType = SQLDataTypes.VARCHAR50)
    private String Name;
    @Column(columnName = "BrandID", columnType = SQLDataTypes.INTEGER)
    private int BrandID;
    @Column(columnName = "Price", columnType = SQLDataTypes.DOUBLE)
    private double Price;
    @Column(columnName = "Description", columnType = SQLDataTypes.VARCHAR255)
    private String Description;

    public Phone() {
    }

    public Phone(int phoneID, String name, int brandID, double price, String description) {
        PhoneID = phoneID;
        Name = name;
        BrandID = brandID;
        Price = price;
        Description = description;
    }

    public int getPhoneID() {
        return PhoneID;
    }

    public void setPhoneID(int phoneID) {
        PhoneID = phoneID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getBranID() {
        return BrandID;
    }

    public void setBranID(int branID) {
        BrandID = branID;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public boolean isValid() {
        return (getErrors().size() == 0);
    }

    public HashMap<String, String> getErrors() {
        HashMap<String, String> errors = new HashMap<>();
        if (Name == null || Name.length() == 0) {
            errors.put("name", "Name is required !");
        }
        if (!(Price > 0)) {
            errors.put("price", "Price must be > 0 !");
        }
        if (Description == null || Description.length() == 0) {
            errors.put("description", "Description ís required !");
        }
        if (BrandID == 0) {
            errors.put("brand", "Brand is required !");
        }

        return errors;
    }
}
