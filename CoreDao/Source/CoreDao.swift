//
//  CoreDao.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

public class CoreDao<Element: NSManagedObject>: ConfigurableDao {
    
    public var context: NSManagedObjectContext
    
    init(with nameContainer: String) {
        let coreStack = CoreStack(with: nameContainer)
        context = coreStack.persistentContainer.viewContext
    }
        
    func new() -> Result<Element, CoreError> {
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as? Element else {
            return .failure(.undefinedNewObject)
        }
        return .success(entity)
    }
    
    public func insert(object: Element) -> Result<Void, CoreError> {
        context.insert(object)
        return save()
    }
    
    public func fetchAll() -> Result<[Element], CoreError> {
        let request = NSFetchRequest<Element>(entityName: Element.className)

        do {
            let result = try context.fetch(request)
            return .success(result)
        } catch {
            return .failure(.fetchFail)
        }
    }
    
    public func delete(object: Element) -> Result<Void, CoreError> {
        context.delete(object)
        return save()
    }
    
    public func save() -> Result<Void, CoreError> {
        do {
            try context.save()
            return .success(())
        } catch {
            return .failure(.saveFail)
        }
    }
}





