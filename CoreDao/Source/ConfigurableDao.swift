//
//  ConfigurableDao.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

protocol ConfigurableDao {
    associatedtype Object
    func insert(object: Object) -> Result<Void, CoreError>
    func delete(object: Object) -> Result<Void, CoreError>
    func fetchAll() -> Result<[Object], CoreError>
    func new() -> Result<Object, CoreError>
    func save() -> Result<Void, CoreError>
}
