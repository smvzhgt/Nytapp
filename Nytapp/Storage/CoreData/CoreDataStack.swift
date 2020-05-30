//
//  CoreDataStack.swift
//  Nytapp
//
//  Created by oleg on 31.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Initializers
    static let shared = CoreDataStack()
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Nytapp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
