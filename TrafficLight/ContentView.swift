//
//  ContentView.swift
//  TrafficLight
//
//  Created by Анна Белова on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State  private var redOpacity: Double = 0.3
    @State  private var yellowOpacity: Double = 0.3
    @State  private var greenOpacity: Double = 0.3
    
    @State private var buttonLabel: String = "START"
    
    @State private var currentLight = CurrentLight.red
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack {
                    TrafficLightCircleView(
                        color: Color.red,
                        opacity: redOpacity
                    )
                    TrafficLightCircleView(
                        color: Color.yellow,
                        opacity: yellowOpacity
                    )
                    TrafficLightCircleView(
                        color: Color.green,
                        opacity: greenOpacity
                    )
                }
                Spacer()
                
                Button(action: startButtonPressed) {
                    Text(buttonLabel)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 3))
                }
            }
            .padding(.bottom, 20)
        }
        
    }
    
    private func startButtonPressed() {
        if buttonLabel == "START" {
            buttonLabel = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLight =  .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
            greenOpacity = lightIsOn
            yellowOpacity =  lightIsOff
            currentLight = .red
        }
    }
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
