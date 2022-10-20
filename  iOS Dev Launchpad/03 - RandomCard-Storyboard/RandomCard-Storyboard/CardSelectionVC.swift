//
//  CardSelectionVC.swift
//  RandomCard-Storyboard
//
//  Created by Mark Battistella on 5/8/21.
//

import UIKit

class CardSelectionVC: UIViewController {
	
	// storyboard items
	@IBOutlet weak var cardImage: UIImageView!
	@IBOutlet var buttons: [UIButton]!
	
	// variables
	var timer: Timer!
	var output = "1S"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// style button
		buttonStyling()
		
		// start the timer and image change
		startTimer()
	}
	
	// when this view changes
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		// stop the timer on screen change
		timer.invalidate()
	}
	
	
	func startTimer() {
		timer = Timer.scheduledTimer(
			
			// 1/10 of a second
			timeInterval: 0.1,
			
			// this view
			target: self,
			
			// what function to trigger
			selector: #selector(showRandomImage),
			
			// no user info
			userInfo: nil,
			
			// loop or run out
			repeats: true
		)
	}
	
	// what to do on the timer trigger
	@objc func showRandomImage() {
		
		let suits = [ "C", "S", "D", "H" ]
		let values = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13" ]
		
		// randomise the array output
		let randomValue = values.randomElement() ?? "1"
		let randomSuit = suits.randomElement() ?? "C"
		
		// build the image string
		output = "\(randomValue)\(randomSuit)"
		
		// change the image
		cardImage.image = UIImage(named: output)
	}
	
	// IB: stop the timer function
	@IBAction func stopButtonTapped(_ sender: UIButton) {
		
		// stop the timer
		timer.invalidate()
	}
	
	// IB: restart the timer function
	@IBAction func restartButtonTapped(_ sender: UIButton) {
		
		// stop the timer
		timer.invalidate()
		
		// restart the timer
		startTimer()
	}
	
	// func: style buttons
	func buttonStyling() {
		
		for button in buttons {
			button.layer.cornerRadius = 8
		}
	}
}
