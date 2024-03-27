//
//  ContentView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedIndex = 0
    
    var body: some View{
        ZStack(alignment: .bottom){
            CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                let type = TabType(rawValue: index) ?? .Water
                getTabView(type: type)
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .Water:
           WaterView()
        case .History:
           HistoryView()
        }
    }
}

#Preview {
    ContentView()
}
