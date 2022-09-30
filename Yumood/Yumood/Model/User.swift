//
//  User.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import Foundation

class User:Identifiable, ObservableObject {
    
    internal init(email: String, passeword: String, name: String, favoriteRecipe: [Recipe], listIngredients: [Chef]) {
        self.email = email
        self.passeword = passeword
        self.name = name
        self.favoriteRecipe = favoriteRecipe
        self.listIngredients = listIngredients
    }
    
    let id = UUID()
    let email: String
    @Published var passeword: String
    @Published var name: String
    @Published var favoriteRecipe: [Recipe]
    var listIngredients: [Chef]
    
    func changeName(newName: String) {
        self.name = newName
    }
    
    func changePasseword(newPasseword: String){
        self.passeword = newPasseword
    }
    
    func addRecipe(newRecipe: Recipe) {
        self.favoriteRecipe.append(newRecipe)
    }
}

var user1 = User(email: "Aime@gmail.com", passeword: "test", name: "Aimé", favoriteRecipe: [caponata, arepa], listIngredients: [chefMojgan])

var user2 = User(email: "Test", passeword: "test1",name: "Mauricio", favoriteRecipe: [], listIngredients: [chefPepone])

var userTab = [user1, user2]
