
public class Book implements Product {

	@Override
	public String getPrice(int br) {
		if(br<100) {
			return "��������";
		}
		else {
			return "���� ��������";
		}
		
	}

	@Override
	public void showName() {
		System.out.println("�����");
		
	}

	@Override
	public void showLoc() {
		System.out.println("��������� ����");
		
	}

}
