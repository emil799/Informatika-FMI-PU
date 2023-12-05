package student.examples;

public class MainClass {

	public static void main(String[] args) {
		Student s1=new Student("Ivan","4812062366",72);
		Student s2=new Student("Emil","0142252344",20);
		s2.moveToNextGrade();
		s1.setEgn("0142252344");
		System.out.println(s1.printInfo());
		System.out.println(s2.printInfo());


	}

}
