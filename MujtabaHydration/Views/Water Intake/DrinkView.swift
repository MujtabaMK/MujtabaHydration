//
//  DrinkView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct DrinkView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // View uses a WaterData instance
    var drink:WaterData
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .foregroundColor(colorScheme == .light ? .white : .black)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 3)
            
            // Info
            HStack {
                // Amount
                Text(String(drink.amount)+" mL")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                Spacer()
                
                // Type of drink
                Text(Constants.drinks[drink.drinkID])
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                // Icon based on drink type
                Image(systemName: "drop.fill")
                    .foregroundColor(Constants.drinkColors[drink.drinkID])
                
                // Time entered
                Text(DateHelper.getTimeString(time: drink.date))
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
            .padding()
        }
    }
}

#Preview {
    DrinkView(drink: Constants.sampleModel.intake[0])
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
