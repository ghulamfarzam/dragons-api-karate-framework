package api.data;

import com.oracle.truffle.js.builtins.math.MathBuiltins.Math;

public class GenerateData {
	
	public static String getEmail(){
		String email = "woodside";
		String provider = "@gmail.com";
		int randomNumber = (int) (Math.random()* 10000);
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
		
	}
	
	
	

}
