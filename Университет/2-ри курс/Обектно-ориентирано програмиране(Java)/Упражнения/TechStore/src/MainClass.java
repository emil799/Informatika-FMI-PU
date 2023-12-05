import java.lang.management.GarbageCollectorMXBean;
import java.util.ArrayList;
import java.util.stream.Collectors;

public class MainClass {

	public static void main(String[] args){
		
		Catalogue catalogue = new Catalogue();
		catalogue.readProductsFromFile("C:\\Users\\grmed\\Desktop\\2-�� ����\\�������-����������� ������������(Java)\\store.txt");
		
		catalogue.sortByPriceComparator();
		//catalogue.sortByPriceComparable();
		
		catalogue.printCatalogue();
		
		catalogue.writeCatalogueToFile("C:\\Users\\grmed\\Desktop\\2-�� ����\\�������-����������� ������������(Java)\\catalogue.txt");

	}//end main()

}//end MainClass
