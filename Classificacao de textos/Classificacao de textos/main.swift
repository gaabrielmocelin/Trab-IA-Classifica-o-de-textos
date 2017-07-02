//
//  main.swift
//  Classificacao de textos
//
//  Created by Gabriel Mocelin on 29/06/17.
//  Copyright © 2017 Gabriel Mocelin. All rights reserved.
//

import Foundation

let urlEsporte = URL(fileURLWithPath: "/Users/gabrielmocelin/Documents/Facul/trab 4 IA/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/esporte.json")

let urlPolicia = URL(fileURLWithPath: "/Users/gabrielmocelin/Documents/Facul/trab 4 IA/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/policia.json")

let urlProblema = URL(fileURLWithPath: "/Users/gabrielmocelin/Documents/Facul/trab 4 IA/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/problema.json")

let urlTrabalho = URL(fileURLWithPath: "/Users/gabrielmocelin/Documents/Facul/trab 4 IA/Trab-IA-Classifica-o-de-textos/Classificacao de textos/Classificacao de textos/parsed/trabalho.json")

let manager = JsonManager()
let esporteBagOfWords = manager.readJson(with: urlEsporte)
let policiaBagofWords = manager.readJson(with: urlPolicia)
let problemaBagofWords = manager.readJson(with: urlProblema)
let trabalhoBagofWords = manager.readJson(with: urlTrabalho)

let bagOfWords = BagOfWords()

bagOfWords.append(array: esporteBagOfWords)
bagOfWords.append(array: policiaBagofWords)
bagOfWords.append(array: problemaBagofWords)
bagOfWords.append(array: trabalhoBagofWords)

for w in bagOfWords.bag{
    print(w)
}

