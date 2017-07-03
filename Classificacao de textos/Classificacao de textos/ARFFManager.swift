//
//  ARFFManager.swift
//  Classificacao de textos
//
//  Created by Uriel Battanoli on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Foundation

class ARFFManager {
    
    static func getMatriz(bag: Set<String>, textArray: [TextClass]) -> String {
        var matriz = ""
        var classes = "{"
        textArray.forEach { textsDict in
            classes += "\(textsDict.classType),"
            let keys = textsDict.texts.keys
            
            for key in keys {
                guard let text = textsDict.texts[key] else {
                    continue
                }
                var line = ""
                
                bag.forEach { word in
                    line += "\(text.contains(word) ? 1 : 0), "
                }
                matriz += "\(line)\(textsDict.classType)\n"
            }
        }
        classes.characters.removeLast()
        
        var words = ""
        var count = 0
        bag.forEach { word in
            count += 1
            words += "@attribute w\(count) integer\n"
        }
        
        var header = "@relation Arquivo\n"
        header += words
        header += "@attribute classe \(classes)}\n@data\n"
        
        return header + matriz
    }
    
    static func writeFile(file: String, text: String) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
        }
    }
}
