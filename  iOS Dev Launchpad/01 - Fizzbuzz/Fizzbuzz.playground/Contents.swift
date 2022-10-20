import UIKit

// Write a fuction that iterates through numbers 1-100

// For numbers divisible by 3, print "FIZZ"
// For numbers divisible by 5, print "BUZZ"
// For numbers divisible by 3 & 5 (like the number 15), print "FIZZBUZZ!"
// For numbers that don't meet any of these qualifications, print the number.

func fizzbuzz() {
	
	// loop numbers 1...100
	for number in 1...100 {
		
		// divisible by 3 and 5
		if( (number % 3 == 0) && (number % 5 == 0) ) {
			print("FIZZBUZZ!")

		} else if(number % 3 == 0) {
			
			// divisible by 3
			print("FIZZ")
		
		} else if(number % 5 == 0) {
			
			// divisible by 3
			print("FIZZ")
		} else {
			
			// print all other numbers
			print(number)
		}
	}
}

// run it
fizzbuzz()
