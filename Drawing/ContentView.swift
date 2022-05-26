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

struct Trapazoid: Shape{
	var insetAmount: Double
	
	var animatableData: Double {
		get { insetAmount }
		set { insetAmount = newValue }
	}
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x:0, y: rect.maxY))
		path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: 0, y: rect.maxY))
		return path
	}
}


struct ContentView: View {
	@State private var insetAmount = 0.0
	
    var body: some View {
		 Trapazoid(insetAmount: insetAmount)
		 .frame(width: 200, height: 200)
		 .onTapGesture {
			 withAnimation {
				 insetAmount = Double.random(in: 10...90)
			 }
		 }
	 }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
