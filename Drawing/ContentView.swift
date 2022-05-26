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


struct CheckerBoard: Shape {
	var rows: Int
	var columns: Int
	
	var animatableData: AnimatablePair<Double, Double> {
		get {
			AnimatablePair(Double(rows), Double(columns))
		}
		set {
			rows = Int(newValue.first)
			columns = Int(newValue.second)
		}
		
	}
	
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		let rowSize = rect.height / Double(rows)
		let columnSize = rect.width / Double(columns)
		
		for row in 0..<rows {
			for column in 0..<columns {
				if (row + column).isMultiple(of: 2) {
					let startX = columnSize * Double(column)
					let startY = rowSize * Double(row)
					
					let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
					path.addRect(rect)
				}
			}
		}
		return path
	}
}

struct ContentView: View {
	@State private var rows = 4
	@State private var columns = 4
	
    var body: some View {
			CheckerBoard(rows: rows, columns: columns)
			 .onTapGesture {
				 withAnimation(.linear(duration: 3)) {
					 rows = 8
					 columns = 16
				 }
			 }
	 }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
