//
//  JsonManager.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class JsonManager: NSObject {
    
    
    func readJson(with resource:String) {
        
        if let path = Bundle.main.path(forResource: "parsedEsportes", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                print(myStrings[0])
            } catch {
                print(error)
            }
        }
        
//        do {
//            if let file = Bundle.main.url(forResource: resource, withExtension: "json") {
//                let data = try Data(contentsOf: file)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                if let object = json as? [String: Any] {
//                    // json is a dictionary
//                    print(object)
//                } else if let object = json as? [Any] {
//                    // json is an array
//                    print(object)
//                } else {
//                    print("JSON is invalid")
//                }
//            } else {
//                print("no file")
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
    }

}
