//
//  TabBottomView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct TabBottomView: View {
    let tabbarItems: [TabItemData]
    var height: CGFloat = 90
    var width: CGFloat = UIScreen.main.bounds.width
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                self.selectedIndex = 0
            } label: {
                let item = tabbarItems[0]
                let isSelected = selectedIndex == 0
                TabItemView(data: item, isSelected: isSelected)
                    .padding(.bottom, UIDevice.current.hasNotch ? 10 : 0)
            }
            Spacer()
            Button {
                self.selectedIndex = 1
            } label: {
                let item = tabbarItems[1]
                let isSelected = selectedIndex == 1
                TabItemView(data: item, isSelected: isSelected)
                    .padding(.bottom, UIDevice.current.hasNotch ? 10 : 0)
            }
            Spacer()
        }
        .frame(width: width, height: height)
        .background(Color.tabBarColour)
        .cornerRadius(18, corners: [.topLeft, .topRight])
        .shadow(radius: 5, x: 0, y: 4)
    }
}
