//
//  CoreDaoTests.swift
//  CoreDaoTests
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import XCTest
import CoreData
@testable import CoreDao

class CoreDaoTests: XCTestCase {
    
    let coreDaoTest = CoreDao<Person>(with: "Person")
    
    func testCoreDataResponseCreate() {
        XCTAssertNotNil(coreDaoTest.context)
    }
    
    
    func testCoreDaoCreate() {
        let name = "Stub"
        let age = "18"
        let person = coreDaoTest.new()
        person.name = name
        person.age = age
        coreDaoTest.save()
        coreDaoTest.insert(object: person)
        XCTAssertEqual(person.name, name)
        XCTAssertEqual(person.age, age)
        XCTAssertNotNil(person)
    }
    
    func testCoreDaoFetch() {
        let people = coreDaoTest.fetchAll()
        var specificPerson: Person?
        people.forEach { (person) in
            XCTAssertNotNil(person)
            specificPerson = person
        }
        let person = people.filter({$0 == specificPerson})
        XCTAssertEqual(person.first, specificPerson)
    }
    
    
    func testCoreDaoDelete() {
        let person = coreDaoTest.new()
        person.name = "Stub"
        coreDaoTest.insert(object: person)
        coreDaoTest.save()
        XCTAssertNotNil(coreDaoTest.fetchAll().filter({$0 == person}))
        coreDaoTest.delete(object: person)
        XCTAssertEqual([], coreDaoTest.fetchAll().filter({$0 == person}))
    }
    
    func testCoreStack() {
        let coreStack = CoreStack(with: "Person")
        
        XCTAssertNotNil(coreStack)
        
        XCTAssertEqual(coreStack.nameContainer, "Person")
        
        coreStack.saveContext()
        
        XCTAssertNotNil(coreStack.persistentContainer)
        
        XCTAssertNotNil(coreStack)
    }
    
    
    func testClassNameAtNSMObject() {
        class Stub: NSManagedObject {}
        XCTAssertEqual(Stub.className, "Stub")
    }
}
