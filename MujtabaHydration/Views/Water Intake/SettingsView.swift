//
//  SettingsView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct SettingsView: View {
    // View writes to both the hydration model and health model
    @ObservedObject var hydration:HydrationModel
    
    // presentationMode property used to close the sheet
    @Environment(\.presentationMode) var presentationMode
    @State var existingIndex:Int
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Header
            Text("Settings")
                .font(.largeTitle)
                .bold()
                .padding(.vertical)
                
            Text("Set your goal:")
                .font(.callout)
            
            
            // Goal amount picker
            Picker(selection: $existingIndex, label: Text("Picker"), content: {
                ForEach(0..<42) { number in
                    Text("\(number * 100 + 2000) mL")
                }
            })
            .pickerStyle(WheelPickerStyle())
            
            
            // Save button
            Button(action: {

                // Model saves new goal
                hydration.saveGoal(index: existingIndex)
                // After saving, close this view (sheet goes away in the app)
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                HStack {
                    Text("Save")
                    Image(systemName: "square.and.arrow.down")
                }
                .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(customButtonStyle())

            Spacer()
        }
    }
}

#Preview {
    SettingsView(hydration: Constants.sampleModel, existingIndex: 17)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
