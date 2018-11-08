package com.ict.erp;

public class Test {
	public int math(int num1,int num2,String a) {		
		if(a=="+") {
			System.out.println(num1+num2);
		}else if(a=="-") {
			System.out.println(num1-num2);
		}else if(a=="*") {
			System.out.println(num1*num2);
		}else if(a=="/"){
			System.out.println(num1/num2);
		}
		return 0;
	}
}


