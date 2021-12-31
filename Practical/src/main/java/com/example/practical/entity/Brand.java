package com.example.practical.entity;

import com.example.practical.annotation.Column;
import com.example.practical.annotation.Entity;
import com.example.practical.annotation.Id;
import com.example.practical.util.SQLDataTypes;

@Entity(tableName = "brand")
public class Brand {
    @Id(autoIncrement = true)
    @Column(columnName = "BrandID", columnType = SQLDataTypes.INTEGER)
    private int BrandID;
    @Column(columnName = "Name", columnType = SQLDataTypes.VARCHAR50)
    private String Name;

    public Brand() {
    }

    public Brand(int brandID, String name) {
        BrandID = brandID;
        Name = name;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int brandID) {
        BrandID = brandID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
