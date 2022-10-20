//
//  Extension+Colour.swift
//  RandomColours
//
//  Created by Mark Battistella on 26/9/20.
//

import UIKit

extension UIColor {
	
	static func random() -> UIColor {
		
		let randomColour = UIColor(
			// random 0..1
			red:	CGFloat.random(in: 0...1),
			green:	CGFloat.random(in: 0...1),
			blue:	CGFloat.random(in: 0...1),
			alpha:	1
		)
		
		return randomColour
	}
	
}
