//
//  HistoryView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        entity: WaterHistory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WaterHistory.data, ascending: false)]
    ) var yourEntities: FetchedResults<WaterHistory>
    
    @State private var alertMessageTwoButton = String()
    @State private var showingAlertTwoButton = false
    @State private var AlertShowTwoButton = String()
    
    @State private var indexValue: Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("History")
                Spacer()
            }
            
            Divider()
            
            ForEach(Array(yourEntities.enumerated()), id: \.offset) { index, water in
                Button{
                    indexValue = index
                    AlertShowTwoButton = "1"
                    alertMessageTwoButton = "Are you sure you want to delete?"
                    showingAlertTwoButton = true
                }label: {
                    HistoryCell(Water: water)
                }
            }
            Spacer()
        }
        .alert(alertMessageTwoButton, isPresented: $showingAlertTwoButton) {
            Button("Cancel", role: .cancel) {
                
            }
            Button("Delete", role: .destructive) {
                let language = yourEntities[indexValue]
                moc.delete(language)
                CoreDataManager().SaveData()
            }
        }
    }
}

#Preview {
    HistoryView()
}
