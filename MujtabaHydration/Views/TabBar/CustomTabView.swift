//
//  CustomTabView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 0)
        }
    }
}

enum TabType: Int, CaseIterable {
    case Water = 0
    case History
    
    var tabItem: TabItemData {
        switch self {
        case .Water:
            return TabItemData(
                image: "drop.fill",
                title: "Water Intake",
                showShow: "Show_Tab_Selected",
                imageHide: "")
        case .History:
            return TabItemData(
                image: "timer.circle.fill",
                title: "History",
                showShow: "Show_Tab_Selected",
                imageHide: "")
        }
    }
}

