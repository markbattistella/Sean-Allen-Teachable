//
//  ColoursDetailVC.swift
//  RandomColours
//
//  Created by Mark Battistella on 23/9/20.
//

import UIKit

class ColoursDetailVC: UIViewController {

	// create the variables
	var colour: UIColor?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		// set the background
		// set it as white if no passed variable
		view.backgroundColor = colour ?? .white
    }
}
