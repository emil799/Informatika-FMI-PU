import java.util.Scanner;

public class AverageTemperatureWithScanner {

	public static void main(String[] args) {
		Scanner input=new Scanner(System.in);
		System.out.println("���� �������� ����������� �� a:");
		double a=input.nextDouble();
		System.out.println("���� �������� ����������� �� b:");
		double b=input.nextDouble();
		System.out.println("���� �������� ����������� �� c:");
		double c=input.nextDouble();
		System.out.println("���� �������� ����������� �� d:");
		double d=input.nextDouble();
		System.out.println((a+b+c+d)/4);
		
		

	}

}
