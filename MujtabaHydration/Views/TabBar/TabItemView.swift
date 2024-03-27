//
//  TabItemView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(isSelected ? data.showShow : data.imageHide)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 3, alignment: .top)
                .offset(y: -10)
            
            Image(systemName: data.image)
                .resizable()
                .scaledToFit()
                .foregroundColor(isSelected ? Color(hex: 0x00B2BA) : Color(hex: 0x969696))
                .frame(width: 20, height: 20)
            
            Spacer()
                .frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? Color(hex: 0x00B2BA) : Color(hex: 0x969696))
                .font(.system(size: 10))
        }
    }
}
