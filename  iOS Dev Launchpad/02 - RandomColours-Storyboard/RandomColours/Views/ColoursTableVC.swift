//
//  ColoursTableVC.swift
//  RandomColours
//
//  Created by Mark Battistella on 23/9/20.
//

import UIKit

class ColoursTableVC: UIViewController {
	
	// create the variables
	let numberOfColours = 1_000
	var colours: [UIColor] = []


	// load the view
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// generate the colour array
		createColoursArray()
	}

	// create the colour array
	func createColoursArray() {
		for _ in 0 ..< numberOfColours {
			colours.append(.random())
		}
	}
	
	// pass the data to the next view
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destinationVC = segue.destination as! ColoursDetailVC
		destinationVC.colour = sender as? UIColor
	}
}

// extend it for better layout
extension ColoursTableVC: UITableViewDelegate, UITableViewDataSource {
	
	// number of rows to show
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return colours.count
	}
	
	// cell data
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// cell is optional
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colourCell) else {
			return UITableViewCell()
		}
		
		// set the cell background
		cell.backgroundColor = colours[indexPath.row]
		
		// execute
		return cell
	}
	
	// pass the data to the next view
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let colour = colours[indexPath.row]
		performSegue(withIdentifier: Segue.colourDetail, sender: colour)
	}
}
