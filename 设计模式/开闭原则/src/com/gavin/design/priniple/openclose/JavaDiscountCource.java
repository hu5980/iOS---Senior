package com.gavin.design.priniple.openclose;

public class JavaDiscountCource extends JavaCource {

    public JavaDiscountCource(Integer id, String name,Double price) {
        super(id,name,price);
    }

    public Double originPrice(){
        return super.getPrice();
    }

    @Override
    public Double getPrice() {
        if (super.getPrice() > 300){
            return  super.getPrice() * 0.8;
        }
        return  super.getPrice() * 0.9;
    }
}
