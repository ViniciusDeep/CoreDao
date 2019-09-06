//
//  ViewController.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let personDao = CoreDao<Person>(with: "Person")
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let person = personDao.new()
        switch person {
        case .success(let person):
            person.name = "Example name"
            person.age = "20"
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
}

