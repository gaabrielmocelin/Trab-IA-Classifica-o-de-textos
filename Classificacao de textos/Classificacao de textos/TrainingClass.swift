//
//  TrainingClass.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class TrainingClass: NSObject {
    var texts: [String:[String]] = [:]
    var classType = ""
    
    func append(key: String, value: [String]) {
        texts[key] = value
    }
}
