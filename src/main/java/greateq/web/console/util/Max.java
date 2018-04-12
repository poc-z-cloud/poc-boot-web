package greateq.web.console.util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Random;

public class Max {
	public static int randInt(int min, int max) {

	    // Usually this can be a field rather than a method variable
	    Random rand = new Random();

	    // nextInt is normally exclusive of the top value,
	    // so add 1 to make it inclusive
	    int randomNum = rand.nextInt((max - min) + 1) + min;

	    return randomNum;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HashSet<Integer> set = new HashSet<Integer>();
		while(set.size()<7){
			set.add(Max.randInt(1, 49));
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.addAll(set);
		Collections.sort(list);
		
		for (Integer i:list){
			System.out.print(i+" : ");
		}
		System.out.println();

	}

}