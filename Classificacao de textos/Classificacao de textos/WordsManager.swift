//
//  Word.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class Word: NSObject {
    var text:String
    var count = 0
    
    init(text:String) {
        self.text = text
    }
}

class WordsManager: NSObject {
   var words = [Word]()
    
    func append(word: String) {
       var exist = false
        
        for w in words{
            if w.text == word {
                w.count = w.count + 1
                exist = true
            }
        }
        
        if exist == false{
            let new = Word(text: word)
            words.append(new)
        }  
    }
    
    func MostImportants(n: Int) -> [Word] {
        var array = [Word]()
        
        words.sort(by: sort(w1:w2:))
        
        for index in 0..<n{
            array.append(words[index])
        }
        
        return array
    }
    
    func sort(w1: Word, w2: Word) -> Bool {
        if w1.count > w2.count{
            return true
        }else{
            return false
        }
    }
}
