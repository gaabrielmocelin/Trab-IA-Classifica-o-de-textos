//
//  JsonManager.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 02/07/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Cocoa

class JsonManager: NSObject {
    
    //this 2 classes only save the texts with their array of words and
    //separate the texts in test and training
    var testClass = TestClass()
    var trainingClass = TrainingClass()
    
    func readJson(with url:URL, classType: String) -> [Word] {
        //cleaning
        testClass = TestClass()
        trainingClass = TrainingClass()
        
        //setting the class type. Ex: esporte
        testClass.classType = classType
        trainingClass.classType = classType
        
        //who handle the bag of words of this class
        let wordsManager = WordsManager()
        
        var array = [Word]()
        
        do {
                //parsing the json
                let data = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let json = json as? [String: Any] {
                    // json is a dictionary string to array of strings
                    for texts in json{
                        //taking the array of strings
                        let text = json[texts.key] as? [String]
                        //if isnt null
                        if let text = text{
                            
                            //taking the number of the text
                            if let number = Int(texts.key){
                                //under 60 is test
                                if number <= 60 {
                                    //saving the text with his words
                                    trainingClass.append(key: texts.key, value: text)
                                }else{
                                    //is training
                                    //saving the text with his words
                                    testClass.append(key: texts.key, value: text)
                                }
                            }
                            
                            //adding the words to the bag.
                            for word in text{
                                wordsManager.append(word: word)
                            }
                        }
                       
                    }
                    
               //     print(wordsManager.words.count)
                    
                    
                    //here you can choose the number of words in the bag
                    //we should try different numbers
                    array = wordsManager.MostImportants(n: 100)
                    
                } else {
                    print("JSON is invalid")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return array
    }

}
