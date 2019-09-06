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
//        let person = personDao.new()
//        person.name = "Vinicius"
//        person.age = "20"
//        personDao.insert(object: person)
//
      
        _ = personDao.new()
        
        personDao.fetchAll().forEach { (person) in
            print(person.name!)
            print(person.age!)
        }
    }
}

