package TriangleChecker;

import java.util.Scanner;

public class TriangleChecker {

	public static void main(String[] args) {
		Scanner input=new Scanner(System.in);
		System.out.println("���� �������� ��������� �� a,b,c: ");
		double a=input.nextDouble();
		double b=input.nextDouble();
		double c=input.nextDouble();
		if(a + b <= c || a + c <= b || b + c <= a) {
			System.out.println("���������� ����� ����������!");
		}
		else {
			System.out.println("�� ���������� ����� ����������!");
		}
		if(a==b && b==c) {
			System.out.println("���� � ������������ ����������!");
		}
		else if(a==b || b==c || c==a) {
			System.out.println("���� � ����������� ����������!");
		}
		else {
			System.out.println("���� � ������������ ����������!");
		}

	}

}
