//
//  CoreDao.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData


protocol DecodableDAO {
    
    associatedtype Element
    typealias GenericElement = NSManagedObject
    
    func fetchAll() -> Element
    func postObject(element: Element)
    func deleteObject(element: GenericElement)
    func putObject(element: GenericElement)
}

public class CoreDao<Element: NSManagedObject>: ConfigurableDao {
    
    public var context: NSManagedObjectContext
    
    init(with containerName: String) {
        let coreStack = CoreStack(with: containerName)
        context = coreStack.persistentContainer.viewContext
    }
    
    public func new() -> Element {
        return NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as! Element
    }
    
    public func insert(object: Element) {
        context.insert(object)
        save()
    }
    
    public func fetchAll() -> [Element] {
        let request = NSFetchRequest<Element>(entityName: Element.className)
        let result = try! context.fetch(request)
        return result
    }
    
    public func delete(object: Element) {
        context.delete(object)
        save()
    }
    
    public func save() {
        do {
            do {
                try context.save()
            } catch {
                fatalError()
            }
        }
    }
    
    
}


extension CoreDao: DecodableDAO {
    func postObject(element: [Element]) {
        
    }
    
    func deleteObject(element: CoreDao.GenericElement) {
        
    }
    
    func putObject(element: CoreDao.GenericElement) {
        
    }
}

protocol ConfigurableService {
    
    typealias Element = Decodable
    
    
    func post(object: [Element])
    func fetch() -> [Element]?
    func put(object: [Element])
    func delete(object: [Element])
}

internal class Service: ConfigurableService {
    func post(object: [Service.Element]) {
    }
    
    func fetch() -> [Service.Element]? {
        return nil
    }
    
    func put(object: [Service.Element]) {
        
    }
    
    func delete(object: [Service.Element]) {
        
    }
}
