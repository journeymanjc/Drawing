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

struct ColorCyclingCircle: View {
	var amount = 0.0
	var steps : Int = 100
	
	var body: some View {
		ZStack{
			ForEach(0..<steps) { value in
				Circle()
					.inset(by: Double(value))
					.strokeBorder(
						LinearGradient(
							gradient: Gradient(colors: [
							color(for: value, brightness: 1),
							color(for: value, brightness: 0.5)
							]),
							startPoint: .top,
							endPoint: .bottom
						),
						lineWidth: 2
					)
			}
		}
		.drawingGroup()
	}
	
	func color(for value: Int, brightness: Double)-> Color {
		var targetHue = Double(value) / Double(steps) + amount
		if targetHue > 1{
			targetHue -= 1
		}
		return Color(hue: targetHue, saturation: 1, brightness: brightness)
	}
}


struct ContentView: View {
	@State private var amount = 0.0
	
    var body: some View {
		 VStack{
			 ZStack{
				Image("Jae")
					 .resizable()
					 .scaledToFit()
					 .frame(width: 200, height: 200)
					 .saturation(amount)
					 .blur(radius: (1 - amount) * 20)
			 }
			 .frame(width: 300, height: 300)
			 
			 Slider(value: $amount)
				 .padding()
		 }
		 
		 .frame(maxWidth: .infinity, maxHeight: .infinity)
		 .background(.black)
		 .ignoresSafeArea()
	 }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
