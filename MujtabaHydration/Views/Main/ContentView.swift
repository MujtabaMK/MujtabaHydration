//
//  ContentView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack{
            ZStack{
                TabView{
                    WaterView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            if self.selectedIndex == 0{
                                Image(systemName: "drop.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                                Text("Water Intake")
                                    .foregroundColor(Color("bg"))
                            }else{
                                Image(systemName: "drop.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.gray)
                                Text("Water Intake")
                                    .foregroundColor(.gray)
                            }
                        }
                        .tag(0)
                    
                    HistoryView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            if self.selectedIndex == 0{
                                Image(systemName: "timer.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                                Text("History")
                                    .foregroundColor(Color("bg"))
                            }else{
                                Image(systemName: "timer.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.gray)
                                Text("History")
                                    .foregroundColor(.gray)
                            }
                        }
                        .tag(0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
