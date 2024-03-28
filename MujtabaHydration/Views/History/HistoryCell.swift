//
//  HistoryCell.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct HistoryCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var Water: WaterHistory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text(Water.data ?? "")
                    .font(.system(size: 15))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
                Spacer()
                
                Text("\(Water.total ?? "")mL")
                    .font(.system(size: 15))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                Text("/")
                    .font(.system(size: 15))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                Text("\(Water.complete ?? "")mL")
                    .font(.system(size: 15))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                                
            }
            HStack{
                Text("Goal Completed:")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                Text(Water.percentage ?? "")
                    .font(.system(size: 15))
                    .foregroundColor(colorScheme == .light ? .black : .white)
                
            }
            HStack{
                Text("Status:")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                if Water.percentage == "100%"{
                    Text("Completed")
                        .font(.system(size: 15))
                        .foregroundColor(colorScheme == .light ? .green : .green)
                }else{
                    Text("Partialy Completed")
                        .font(.system(size: 15))
                        .foregroundColor(colorScheme == .light ? .orange : .orange)
                }
                
                Spacer()
                
                Image(systemName: "trash.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 16, height: 20)
                    .foregroundColor(colorScheme == .light ? .black : .white)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(colorScheme == .light ? .white : .black)
        .frame(width: getRect().width - 40)
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: .gray, radius: 3)
    }
}
