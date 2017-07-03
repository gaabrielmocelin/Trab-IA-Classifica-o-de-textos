//
//  main.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 29/06/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Foundation

let urlEsporte = URL(fileURLWithPath: "/Users/Uriel/Documents/Facul/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/esporte.json")

let urlPolicia = URL(fileURLWithPath: "/Users/Uriel/Documents/Facul/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/policia.json")

let urlProblema = URL(fileURLWithPath: "/Users/Uriel/Documents/Facul/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/problema.json")

let urlTrabalho = URL(fileURLWithPath: "/Users/Uriel/Documents/Facul/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/trabalho.json")

let manager = JsonManager()
let esporteBagOfWords = manager.readJson(with: urlEsporte,classType: "esporte")
//this keep the words of each text that is test
let esporteTestTexts = manager.testClass
//this keep the words of each text that is training
let esporteTrainingTexts = manager.trainingClass

let policiaBagofWords = manager.readJson(with: urlPolicia,classType: "policia")
let policiaTestTexts = manager.testClass
let policiaTrainingTexts = manager.trainingClass

let problemaBagofWords = manager.readJson(with: urlProblema,classType: "problema")
let problemaTestTexts = manager.testClass
let problemaTrainingTexts = manager.trainingClass

let trabalhoBagofWords = manager.readJson(with: urlTrabalho,classType: "trabalho")
let trabalhoTestTexts = manager.testClass
let trabalhoTrainingTexts = manager.trainingClass

//print(esporteTestTexts.texts.count)
//print(esporteTrainingTexts.texts.count)
//print(trabalhoTestTexts.texts.count)
//print(trabalhoTrainingTexts.texts.count)

//the big one
let bagOfWords = BagOfWords()

bagOfWords.append(array: esporteBagOfWords)
bagOfWords.append(array: policiaBagofWords)
bagOfWords.append(array: problemaBagofWords)
bagOfWords.append(array: trabalhoBagofWords)

let trainingMatriz = ARFFManager.getMatriz(bag: bagOfWords.bag, textArray: [esporteTrainingTexts, policiaTrainingTexts, problemaTrainingTexts, trabalhoTrainingTexts])
ARFFManager.writeFile(file: "training.arff", text: trainingMatriz)

let testMatriz = ARFFManager.getMatriz(bag: bagOfWords.bag, textArray: [esporteTestTexts, policiaTestTexts, problemaTestTexts, trabalhoTestTexts])
ARFFManager.writeFile(file: "test.arff", text: testMatriz)

print("------------ DONE ---------------")
