//
//  HistoryView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI

struct HistoryView: View {
    
    @FetchRequest(
        entity: WaterHistory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WaterHistory.data, ascending: false)]
    ) var yourEntities: FetchedResults<WaterHistory>
    
    var body: some View {
        VStack{
            ForEach(yourEntities){ water in
                Text(water.percentage ?? "")
            }
        }
    }
}

#Preview {
    HistoryView()
}
