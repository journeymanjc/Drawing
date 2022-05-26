//
//  ContentView.swift
//  Drawing
//
//  Created by Jae Cho on 5/20/22.
//

import SwiftUI
/**
 Create a new empty path
 Count from 0 up to pi * 2, one eight of pi each time which results in 16 petals.
 rotation transform equal to the current number??? what does this mean?
 */
struct Flower: Shape {
	//How much to move this petal away from the center
	var petalOffset: Double = -20
	//How wide to make each petal
	var petalWidth: Double = 100
	
	func path(in rect: CGRect) -> Path {
		// The path that will hold all petals
		var path = Path()
		for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8){
			let rotation = CGAffineTransform(rotationAngle: number)
			let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
			let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
			let rotatedPetal = originalPetal.applying(position)
			path.addPath(rotatedPetal)
		}
		return path
	}
}
struct ContentView: View {
	@State private var petalOffset = -20.0
	@State private var petalWidth = 100.0
    var body: some View {
		 VStack{
			 Flower(petalOffset: petalOffset, petalWidth: petalWidth)
				 //.stroke(.red, lineWidth: 1)
				 .fill(.red, style: FillStyle(eoFill: true))
			 Text("Offset")
			 Slider(value: $petalOffset, in: -40...40)
				 .padding([.horizontal, .bottom])
			 
			 Text("Width")
			 Slider(value: $petalWidth, in: 0...100)
				 .padding(.horizontal)
		 }
	 }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
