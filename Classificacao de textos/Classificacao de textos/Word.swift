//
//  Word.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class Word: NSObject {
    var text: String
    var count = 0
    
    init(text: String) {
        self.text = text
    }
}
