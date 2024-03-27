//
//  CoreDataManager.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import Foundation
import CoreData

class CoreDataManager{
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MujtabaHydration")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return Self.persistentContainer.viewContext
    }
    
    func SaveNotify(total:String, complete:String, date:String, percentage:String){
        let water = WaterHistory(context: CoreDataManager.persistentContainer.viewContext)
        water.total = total
        water.complete = complete
        water.data = date
        water.percentage = percentage
        
        SaveData()
    }
    
    func SaveData(){
        do{
            try CoreDataManager.persistentContainer.viewContext.save()
        }catch{
            print("Failed to Save \(error.localizedDescription)")
        }
    }
}

public extension NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }
}
