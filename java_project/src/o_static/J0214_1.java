package o_static;

public class J0214_1 {

	public static void main(String[] args) {
		
		J0214_2 sss= new J0214_2();
		int re= sss.getTotal(20, 30);
		
		J0214_1_sub sub= new J0214_1_sub();
		int total = sub.getTotal(10, 20);
		
		int sum= J0214_1_sub.getSum(10, 20);
		System.out.println(sum);
		
	}

}
