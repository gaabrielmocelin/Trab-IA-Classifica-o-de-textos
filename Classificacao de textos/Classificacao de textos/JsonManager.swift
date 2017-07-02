//
//  JsonManager.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class JsonManager: NSObject {
    
    func readJson(with url:URL) -> [Word] {
        let wordsManager = WordsManager()
        
        var array = [Word]()
        
//        if let path = Bundle.main.path(forResource: "parsedEsportes", ofType: "txt") {
//            do {
//                let data = try String(contentsOfFile: path, encoding: .utf8)
//                let myStrings = data.components(separatedBy: .newlines)
//                print(myStrings[0])
//            } catch {
//                print(error)
//            }
//        }
        
        do {
            
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let json = json as? [String: Any] {
                    // json is a dictionary
                    for text in json{
                        let text = json[text.key] as? [String]
                        if let text = text{
                            for word in text{
                                wordsManager.append(word: word)
                            }
                        }
                       
                    }
                    
               //     print(wordsManager.words.count)
                    
                    array = wordsManager.MostImportants(n: 10)
                    
//                    for w in array{
//                        print(w.text)
//                    }
                    
                } else {
                    print("JSON is invalid")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return array
    }

}
