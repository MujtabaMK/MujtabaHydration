//
//  MujtabaHydrationApp.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

@main
struct MujtabaHydrationApp: App {
    let dataController = CoreDataManager().context
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController)
        }
    }
}
