//
//  BarcodeScannerView.swift
//  SwiftUI-BarcodeScanner
//
//  Created by Mark Battistella on 12/8/21.
//

import SwiftUI

struct BarcodeScannerView: View {

	@StateObject var viewModel = BarcodeScannerViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				
				ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
					.frame( maxWidth: .infinity, maxHeight: 300 )
				
				Spacer()
					.frame(height: 60)
				
				Label("Scanned barcode", systemImage: "barcode.viewfinder")
					.font(.title)
				
				Text(viewModel.statusText)
					.bold()
					.font(.largeTitle)
					.foregroundColor(viewModel.statusTextColour)
					.padding()
				
			}
			.navigationTitle("Barcode Scanner")
			.alert(item: $viewModel.alertItem) { alertItem in
				Alert(title: Text(alertItem.title),
					  message: Text(alertItem.message),
					  dismissButton: alertItem.dismissButton
				)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		BarcodeScannerView()
	}
}
