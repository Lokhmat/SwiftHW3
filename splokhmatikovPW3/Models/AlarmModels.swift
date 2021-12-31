//
//  CollectionScreenModels.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation
import CoreData

class DataManager{
    private var alarms: [Alarm] = []
    let context: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "CoreDataAlarms")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Container loading failed")
            }
        }
        return container.viewContext
    }()
    
    public func getAlarms() -> [Alarm]{
        let newAlarms = try? context.fetch(Alarm.fetchRequest())
        if (newAlarms != nil && newAlarms?.count != 0) {
            self.alarms = (newAlarms?.sorted(by:
                                                { $0.time < $1.time}))!
        } else {
            for _ in 10..<30{
                let alarm = Alarm(context: context)
                alarm.time = Int32.random(in: 0...1440)
                alarm.descriptionLabel = "Wake the fuck up samurai"
                alarm.isOn = Bool.random()
            }
            saveChanges()
        }
        alarms.sort(by: { $0.time < $1.time})
        return alarms
    }
    
    public func editAlarm(id: Int){
        alarms[id].isOn = !alarms[id].isOn
        saveChanges()
    }
    
    public func saveChanges(){
        if context.hasChanges {
            try? context.save()
        }
        if let alarms = try? context.fetch(Alarm.fetchRequest()) {
            self.alarms = alarms
        } else {
            self.alarms = []
        }
    }
}


