package api.data;

import com.oracle.truffle.js.builtins.math.MathBuiltins.Math;

public class GenerateData1 {
	//create a method that return random phone number 10 digit
		public static String getPhoneNumber() {
			String phoneNumber = "9";
			for(int i = 0; i < 9; i++) {
				phoneNumber += (int)(Math.random() * 10);
			}
			return phoneNumber;
		}

}
