package greateq.web.misc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;


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
	public static List<Integer> generateMax() {
		Set<Integer> set = new HashSet<Integer>();
		while(set.size()<7){
			set.add(Max.randInt(1, 49));
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		List<Integer> list = new ArrayList<Integer>();
		list.addAll(set);
		Collections.sort(list);
		
//		for (Integer i:list){
//			System.out.print(i+" : ");
//		}
//		System.out.println();

		return list;
	}

}
