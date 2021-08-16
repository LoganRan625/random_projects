

import java.util.Scanner;
import java.util.Hashset;
import java.util.set;

public class Scan {

	public static void main(String[] args) {

		/// ARRAY / String[] Array
		String[] arr = new String[3];
		arr[0] = "hi";
		arr[1] = "hello world";
		arr[2] = "Hello World";

		int[] arr2 = {3, 4, 25, 36, 83, 3};

		int var_y = arr2[3];
		String var_x = arr[1];

		System.out.println(var_x);

		///  SCANNER user_input
		Scanner sc = new Scanner(System.in); // waits for user input
		String s = sc.nextLine(); //

		/// if String == var: /  if else if else  /  s.equals()
		if (s.equals("hello world")) // user input must be == "hello world"
		{

			System.out.println("success");

		} else if (s.equals("Hello World")){

			System.out.println("success");

		} else {

			System.out.println("fail");

		}

		/// for i in range(len(array)):
		for (int i = 0 ; i < arr2.length ; i++) {

			if (arr2[i] == 36) {

				System.out.println(arr2[i]);

			}
		}

		/// for i in arr2:
		int count = 0;
		for (int i:arr2) {
			System.out.println(i + " " + count);
			count++;
		}

		/// iter over empty array add user input to i in array
		String[] names = new String[5];
		Scanner sca = new Scanner(System.in);

		for (int i = 0; i < names.length; i++) {
			System.out.print("input: ");
			String input = sca.nextLine();
			names[i] = input;
		}

		/// for i in var:
		for (String n:names) {
			System.out.println(n);

			if (n.equals(names[3])) {
				break;
			}
		}

		/// SET / HASHSET
		set<Integer> t = new HashSet<Integer>();
		t.add(5);
		t.add(345);
		t.add(12);

		t.sixe();

		int x = t.size();

		System.out.println(x);
	}
}
