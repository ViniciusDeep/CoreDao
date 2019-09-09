//
//  CoreError.swift
//  CoreDao
//
//  Created by Thiago Valente on 06/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

public enum CoreError: Error {
    case containerNotFound
    case loadPersistent
    case save
    case undefinedNewObject
    case fetch
    case saveContext
}
