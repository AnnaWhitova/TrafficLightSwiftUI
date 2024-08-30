//
//  TrafficLightCircleView.swift
//  TrafficLight
//
//  Created by Анна Белова on 29.08.2024.
//

import SwiftUI

struct TrafficLightCircleView: View {
    let color: Color
    let opacity: Double
    var body: some View {
        Circle()
              .foregroundColor(color)
              .opacity(opacity)
              .frame(width: 100, height: 100)
              .overlay(Circle().stroke(Color.white, lineWidth: 3))
    }
}

#Preview {
    TrafficLightCircleView(color: .red, opacity: 0.5)
}
