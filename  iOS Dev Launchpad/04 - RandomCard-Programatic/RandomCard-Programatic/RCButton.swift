//
//  RCButton.swift
//  RandomCard-Programatic
//
//  Created by Mark Battistella on 5/8/21.
//

import UIKit

class RCButton: UIButton {

	override init(frame: CGRect) {
		super.init( frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(backgroundColour: UIColor, title: String) {
		super.init(frame: .zero)
		self.backgroundColor = backgroundColour
		setTitle(title, for: .normal)
		configure()
	}
	
	func configure() {
		layer.cornerRadius = 8
		titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
		setTitleColor(.white, for: .normal)
		translatesAutoresizingMaskIntoConstraints = false
	}

}
