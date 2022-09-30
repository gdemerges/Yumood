//
//  PersonalInformation.swift
//  Yumood
//
//  Created by Guillaume DemergÃ¨s on 23/09/2022.
//

import SwiftUI

struct PersonalInformation: View {
    @Binding var isModifying : Bool
    @State var newName = ""
    @State var newPasseword = ""
    @State private var pref = 0
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    @State var ingredients: [Ingredient] = [Ingredient(name: "Cuisine Algérienne"),
                                                                                            Ingredient(name: "Cuisine Australienne"),
                                                                                            Ingredient(name: "Cuisine Colombienne"),
                                                                                            Ingredient(name: "Cuisine Indonesienne"),
    Ingredient(name: "Cuisine Iranienne"),
    Ingredient(name: "Cuisine Italienne")]
    
    var user:User
    
    var body: some View {
        NavigationView{
        VStack {
            HStack {
                Text("Nom")
                TextField("\(user.name)", text: $newName)
                    .disableAutocorrection(true)
            }

            HStack {
                Text("Mot de passe")
                SecureField("\(user.passeword)", text: $newPasseword)
                    .disableAutocorrection(true)
            }
            Text("")
             Text("Préférences alimentaire :")
            HStack{
                LazyVGrid(columns: columns){
                                        ForEach(0..<ingredients.count){ index in
                                                HStack {
                                                        Button(action: {
                                                                ingredients[index].isSelected = ingredients[index].isSelected ? false : true
                                                        }) {
                                                                HStack{
                                                                        if ingredients[index].isSelected {
                                                                                Image(systemName: "checkmark.circle.fill")
                                                                                        .foregroundColor(.green)
                                                    
                                                                        } else {
                                                                                Image(systemName: "circle")
                                                                                        .foregroundColor(.primary)
                                                           
                                                                        }
                                                                        Text(ingredients[index].name)
                                                                }
                                                        }.buttonStyle(BorderlessButtonStyle())
                                                }
                                        }
                }.padding()
                    
                        }
            Button("Valider") {
                isModifying.toggle()
                user.changeName(newName: newName)
                user.changePasseword(newPasseword: newPasseword)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("GeneralColor"))
            }
        }
        .padding()
        .navigationTitle("Editer vos informations")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    isModifying.toggle()
                }label: {
                    Image(systemName: "xmark")
                }
            }
        }
    }
}

struct PersonalInformation_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInformation(isModifying: .constant(true), user: user1)
    }
}

struct Ingredient{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
}
