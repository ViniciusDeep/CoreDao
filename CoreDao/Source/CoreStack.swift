//
//  CoreStack.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

public class CoreStack {
    
    let nameContainer: String!
    
    public init(with nameContainer: String) {
        self.nameContainer = nameContainer
    }
    
    lazy var persistentContainer: Result<NSPersistentContainer, CoreError> = {
        let loadContainer : NSPersistentContainer? = NSPersistentContainer(name: self.nameContainer)
        
        guard let container = loadContainer else {
            return .failure(.containerNotFound)
        }

        var hasError: Bool = false
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let _ = error {
                hasError = true
            }
        })
        
        if (hasError) {
            return .failure(.loadPersistent)
        }
        return .success(container)
    }()
    
    public func saveContext() -> Result<Void, CoreError> {
        switch persistentContainer {
        case .success(let persistentContainer):
            let persistentContainer = persistentContainer
            let context = persistentContainer.viewContext
            
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    return .failure(.saveContext)
                }
            }
            return .success(())
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
