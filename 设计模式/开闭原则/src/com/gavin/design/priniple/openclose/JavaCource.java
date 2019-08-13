package com.gavin.design.priniple.openclose;

public class JavaCource implements ICource {

    private Integer id;
    private  String name;
    private  Double price;

    public JavaCource(Integer id, String name,Double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    @Override
    public Integer getId() {
        return  this.id;
    }

    @Override
    public String getName() {
        return this.name;
    }

    public Double getPrice() {
        return this.price;
    }

//    @Override
//    public Double getDiscountPrice() {
//        return  this.price * 0.8;
//    }
}
