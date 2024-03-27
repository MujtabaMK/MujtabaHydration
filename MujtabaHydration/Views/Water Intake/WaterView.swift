//
//  WaterView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct WaterView: View {
    // App uses two models
    private var health: HealthModel
    private var hydration: HydrationModel
    
    init() {
        health = HealthModel()
        hydration = HydrationModel(healthModel: health)
    }
    
    var body: some View {
        TodayView(hydration: hydration)
            .onAppear {
                
                // On appearance, request authorization of HealthKit
                // (App works without authorization)
                health.requestAuthorization { success in
                    if !success {
                        print("Access not granted!")
                    }
                }
            }
    }
}

#Preview {
    WaterView()
        .preferredColorScheme(.light)
}
