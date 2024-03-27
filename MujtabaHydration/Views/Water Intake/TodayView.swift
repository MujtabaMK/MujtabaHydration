//
//  TodayView.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import SwiftUI
import HealthKit

struct TodayView: View {
    init(hydration:HydrationModel) {
        self.hydration = hydration
        UITableView.appearance().backgroundColor = .clear }
    
    @ObservedObject var hydration:HydrationModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let dataController = CoreDataManager().context
    
    @State private var isExist: Bool = false
    
    @FetchRequest(
        entity: WaterHistory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \WaterHistory.data, ascending: false)]
    ) var yourEntities: FetchedResults<WaterHistory>
    
    // Booleans for 3 sheet views
    @State var addIntakeSheet = false
    @State var settingsSheet = false
    @State var infoSheet = false
    
    @State private var alertMessage = String()
    @State private var showingalert = false
    @State private var AlertShow = String()
    
    @State private var alertMessageTwoButton = String()
    @State private var showingAlertTwoButton = false
    @State private var AlertShowTwoButton = String()
    
    var body: some View {
        VStack(spacing: 10) {
            
            // MARK: - Header
            HStack {
                Spacer()
                VStack {
                    // See DateHelper.swift
                    Text(DateHelper.getDateString(day: hydration.date))
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    Text("Here is your fluid intake")
                        .italic()
                }
                Spacer()
            }
            
            
            // MARK: - Progress bar and goal display
            // See below for progress bar
            ProgressCircle(progress: hydration.progress, complete: (hydration.progress == 1.0))
                .frame(width: 175, height: 175)
                .padding(30.0)
            
            Text("\(hydration.totalIntake) mL / \(hydration.goal) mL")
                .bold()
            
            Spacer()
            
            
            // MARK: - List of intake entries
            List {
                // Calls DrinkView for reach entry (see DrinkView.swift)
                ForEach(hydration.intake) { i in
                    DrinkView(drink: i)
                }
                .onDelete(perform: delete)
            }
            
            
            // MARK: - Utility buttons
            HStack {
                
                // Info
                Button(action: { infoSheet.toggle() }, label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 25, height: 25)
                        .padding(.leading)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                })
                .sheet(isPresented: $infoSheet, content: {
                    InfoView()
                })
                
                Spacer()
                
                HStack{
                    // Add intake
                    Button(action: { addIntakeSheet.toggle()}, label: {
                        HStack {
                            Text("Add Intake")
                            Image(systemName: "plus.circle")
                        }
                    })
                    .sheet(isPresented: $addIntakeSheet, content: {
                        AddIntakeView(hydration: hydration)
                    })
                    .buttonStyle(customButtonStyle())
                    
                    // Save Today
                    Button(action: {
                        let percentage = String(format: "%.0f%%", min(self.hydration.progress, 1.0) * 100.0)
                        
                        if percentage.contains("0%"){
                            alertMessage = "Drink water"
                            AlertShow = "0"
                            showingalert = true
                        }else{
                            for(index, entity) in yourEntities.enumerated(){
                                if entity.data == DateHelper.getDateString(day: hydration.date){
                                    isExist = true
                                }
                            }
                            if !isExist{
                                AlertShowTwoButton = "1"
                                alertMessageTwoButton = "You Can Save it only one time are you sure you want to save?"
                                showingAlertTwoButton = true
                            }else{
                                alertMessage = "Already exist"
                                AlertShow = "0"
                                showingalert = true
                            }
                        }
                    }, label: {
                        HStack {
                            Text("Save")
                            Image(systemName: "square.and.arrow.down")
                        }
                    })
                    .sheet(isPresented: $addIntakeSheet, content: {
                        AddIntakeView(hydration: hydration)
                    })
                    .buttonStyle(customButtonStyle())
                }
                
                Spacer()
                
                // Settings
                Button(action: { settingsSheet.toggle() }, label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 25, height: 25)
                        .padding(.trailing)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                })
                .sheet(isPresented: $settingsSheet, content: {
                    SettingsView(hydration: hydration, existingIndex: hydration.goalIndex)
                })
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
        .alert(alertMessage, isPresented: $showingalert) {
            Button("OK", role: .cancel) {
                if AlertShow == "1"{
                    
                }else{
                    
                }
            }
        }
        .alert(alertMessageTwoButton, isPresented: $showingAlertTwoButton) {
            Button("Cancel", role: .cancel) {
                
            }
            Button("Save", role: .destructive) {
                if AlertShowTwoButton == "1"{
                    let Total = hydration.totalIntake
                    let complete = hydration.goal
                    let date = DateHelper.getDateString(day: hydration.date)
                    let percentage = String(format: "%.0f%%", min(self.hydration.progress, 1.0) * 100.0)
                    
                    CoreDataManager().SaveNotify(total: "\(Total)",
                                                 complete: "\(complete)",
                                                 date: date,
                                                 percentage: "\(percentage)")
                    
                    
                }else{
                    
                }
            }
        }
    }
    
    // Delete function used by the list's built-int deletion
    func delete(at offsets: IndexSet) {
        hydration.removeIntake(offset: offsets)
    }
}



#Preview {
    // Preview uses sample model (see Constants.swift) and an arbitrary HealthModel instance
    TodayView(hydration: Constants.sampleModel)
}
