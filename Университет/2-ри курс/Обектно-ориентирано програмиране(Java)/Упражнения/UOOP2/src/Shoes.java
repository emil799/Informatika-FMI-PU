
public class Shoes implements Product{
	@Override
	public String getPrice(int br) {
		if(br<5) {
			return "��������";
		}
		else {
			return "���� ��������";
		}
		
	}

	@Override
	public void showName() {
		System.out.println("������");
		
	}

	
}
