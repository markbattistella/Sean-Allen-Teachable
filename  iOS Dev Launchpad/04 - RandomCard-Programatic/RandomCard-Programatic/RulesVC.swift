//
//  RulesVC.swift
//  RandomCard-Programatic
//
//  Created by Mark Battistella on 6/8/21.
//

import UIKit

class RulesVC: UIViewController {

	// ui items
	let titleLabel = UILabel()
	let rulesLabel = UILabel()
	let exerciseLabel = UILabel()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		configureTitleLabel()
		configureRulesLabel()
		configureExcersiceLabel()
    }

	func configureTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Rules"
		titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
		titleLabel.textAlignment = .center
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
		])
	}
	
	func configureRulesLabel() {
		view.addSubview(rulesLabel)
		rulesLabel.translatesAutoresizingMaskIntoConstraints = false
		rulesLabel.text = "The value of the card represets the number of exercises you need to do.\n\nA = 1, J = 11, Q = 12, K = 13"
		rulesLabel.font = .systemFont(ofSize: 14, weight: .medium)
		rulesLabel.textAlignment = .center
		rulesLabel.lineBreakMode = .byWordWrapping
		rulesLabel.numberOfLines = 0
		
		NSLayoutConstraint.activate([
			rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
		])
	}
	
	func configureExcersiceLabel() {
		view.addSubview(exerciseLabel)
		exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
		exerciseLabel.text = "♠️  Push-ups\n\n♥️  Sit-ups\n\n♣️  Burpees\n\n♦️  Jumping Jacks"
		exerciseLabel.font = .systemFont(ofSize: 14, weight: .regular)
		exerciseLabel.numberOfLines = 0
		
		NSLayoutConstraint.activate([
			exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20),
			exerciseLabel.widthAnchor.constraint(equalToConstant: 180),
			exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
