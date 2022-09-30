//
//  Continent.swift
//  Yumood
//
//  Created by Guillaume DemergÃ¨s on 22/09/2022.
//

import Foundation

struct Continent:Identifiable{
    let id = UUID()
    var nameContinent: String
    var country: [Pays]
    var imageContinent: String
}

var continent1 = Continent(nameContinent: "Afrique", country: [country2], imageContinent: "africa")
var continent2 = Continent(nameContinent: "Amerique", country: [country1], imageContinent: "america")
var continent3 = Continent(nameContinent: "Asie", country: [country3, country4], imageContinent: "asia")
var continent4 = Continent(nameContinent: "Europe", country: [country5], imageContinent: "europe")
var continent5 = Continent(nameContinent: "Océanie", country: [country6], imageContinent: "oceania")

var continentTab = [continent1, continent2, continent3, continent4, continent5]

