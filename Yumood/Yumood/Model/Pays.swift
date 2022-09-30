//
//  pays.swift
//  Yumood
//
//  Created by apprenant75 on 26/09/2022.
//

import Foundation
struct Pays:Identifiable{
    let id = UUID()
    var nameCountry: String
    var recipe: [Recipe]
   
}

var country1 = Pays(nameCountry: "Colombie", recipe: [arepa])
var country2 = Pays(nameCountry: "Algérie", recipe: [chakhchoukha])
var country3 = Pays(nameCountry: "Indonésie", recipe: [nasiGoreng])
var country4 = Pays(nameCountry: "Iran", recipe: [kukuSabzi])
var country5 = Pays(nameCountry: "Italie", recipe: [pizzaMargueritta, caponata])
var country6 = Pays(nameCountry: "Australie", recipe: [damperRecipe])



var countryTab = [country1, country2, country3, country4, country5, country6]
