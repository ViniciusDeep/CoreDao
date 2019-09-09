//
//  ViewController.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var personDao: CoreDao<Person>! = {
        CoreDao<Person>(with: "Person") { result in
            switch result{
            case .success(let dao):
                return dao
            case .failure(_):
                // Note: can be used as an optional and have its own treatment.
                fatalError("Fail to get person dao")
            }
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let person = personDao.new()
        switch person {
        case .success(let person):
            addPerson(with: person)
        case .failure(let error):
            print("Something wrong. Error: \(error.localizedDescription)")
        }
        
        let people = personDao.fetchAll()
        switch people {
        case .success(let people):
            people.forEach { (person) in
                print(person.name ?? "Undefined name")
                print(person.age  ?? "Undefined age")
            }
        default:
            print("Fail to fetch people")
        }
    }
    
    private func addPerson(with person: Person) {
        person.name = "Example name"
        person.age = "20"
        let isSaved = personDao.save()
        switch isSaved {
        case .success(_):
            print("Saved with success!")
        case .failure(let error):
            print("Fail to save user: \(error)")
        }
    }
    
}

