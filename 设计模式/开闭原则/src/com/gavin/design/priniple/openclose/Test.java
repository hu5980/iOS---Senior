package com.gavin.design.priniple.openclose;

public class Test {

    public static void main(String[] args) {
        ICource iCource = new JavaDiscountCource(96,"java 从0到企业级电商开发",398d);
        JavaDiscountCource javaCource = (JavaDiscountCource) iCource;
        System.out.println("课程ID:" + javaCource.getId() + "课程名称:" + javaCource.getName() +
                "课程原价:" + javaCource.originPrice() + "优惠价格" + javaCource.getPrice());
    }
}

