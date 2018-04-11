//
//  BagOfWords.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class BagOfWords: NSObject {
    var bag = Set<String>()
    
    func append(array: [Word]) {
        
        for word in array{
            if !bag.contains(word.text) {
                bag.insert(word.text)
            }
        }
        
      //  print(bag.count)
    }
}
