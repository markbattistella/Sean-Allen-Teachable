//
//  CardSelectionVC.swift
//  RandomCard-Programatic
//
//  Created by Mark Battistella on 5/8/21.
//

import UIKit

class CardSelectionVC: UIViewController {

	// variables: ui
	let cardImageView	= UIImageView()
	let stopButton		= RCButton(backgroundColour: .systemRed, title: "Stop!")
	let resetButton		= RCButton(backgroundColour: .systemGreen, title: "Reset")
	let rulesButton		= RCButton(backgroundColour: .systemBlue, title: "Rules")

	// variables
	var timer: Timer!
	var output = "1S"

	// view loaded
	override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		// ui setup
		configureUI()
		
		// start the timer
		startTimer()
	}

	// start the timer
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
	
	// set the yje views
	func configureUI() {
		configureCardImageView()
		configureStopButton()
		configureResetButton()
		configureRulesButton()
	}

	// view: image
	func configureCardImageView() {
		
		// add it into the main view
		view.addSubview(cardImageView)
		
		// no auto layout
		cardImageView.translatesAutoresizingMaskIntoConstraints = false
		
		// default image loaded
		cardImageView.image = UIImage(named: "1S")
		
		// set the contraints
		NSLayoutConstraint.activate([
			cardImageView.widthAnchor.constraint(equalToConstant: 250),
			cardImageView.heightAnchor.constraint(equalToConstant: 350),
			cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
		])
	}

	// view: stop button
	func configureStopButton() {

		// add it into the main view
		view.addSubview(stopButton)

		// when tapped
		stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)

		// set the contraints
		NSLayoutConstraint.activate([
			stopButton.widthAnchor.constraint(equalToConstant: 250),
			stopButton.heightAnchor.constraint(equalToConstant: 50),
			stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
		])
	}

	// view: reset button
	func configureResetButton() {

		// add it into the main view
		view.addSubview(resetButton)
		
		// when tapped
		resetButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)

		// set the contraints
		NSLayoutConstraint.activate([
			resetButton.widthAnchor.constraint(equalToConstant: 110),
			resetButton.heightAnchor.constraint(equalToConstant: 50),
			resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
			resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
		])
	}

	// view: rules button
	func configureRulesButton() {
		
		// add it into the main view
		view.addSubview(rulesButton)
		
		// when tapped
		rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
		
		// set the contraints
		NSLayoutConstraint.activate([
			rulesButton.widthAnchor.constraint(equalToConstant: 110),
			rulesButton.heightAnchor.constraint(equalToConstant: 50),
			rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
			rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
		])
	}


	// MARK: - objc functions
	
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
		cardImageView.image = UIImage(named: output)
	}
	
	// stop the timer
	@objc func stopTimer() {
		timer.invalidate()
	}
	
	// restart the timer
	@objc func restartTimer() {
		stopTimer()
		startTimer()
	}

	// show rules view controller
	@objc func presentRulesVC() {
		present(RulesVC(), animated: true)
	}
}
