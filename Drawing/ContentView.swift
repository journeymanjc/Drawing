//
//  ContentView.swift
//  Drawing
//
//  Created by Jae Cho on 5/20/22.
//

import SwiftUI

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x:rect.minX, y: rect.maxY))
		path.addLine(to: CGPoint(x:rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x:rect.midX, y: rect.minY))
		return path
	}
}

struct ContentView: View {
    var body: some View {
		 Triangle()
			// .fill(.red)
			// .frame(width:300, height: 300)
		 .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
