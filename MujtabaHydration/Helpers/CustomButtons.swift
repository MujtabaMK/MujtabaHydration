//
//  CustomButtons.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import Foundation
import SwiftUI


// Blue fade
struct customButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.6)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 1.02 : 1.0)
    }
}


// Orange fade
struct secondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.6)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 1.02 : 1.0)
    }
}
