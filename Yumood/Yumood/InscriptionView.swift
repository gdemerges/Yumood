//
//  InscriptionView.swift
//  Yumood
//
//  Created by Guillaume Demergès on 30/09/2022.
//

import SwiftUI


struct InscriptionView: View {
    @State var email:String = ""
    @State var passeword:String = ""
    @State var name:String = ""
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
    
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Text("Email")
                .font(.callout).bold()
            TextField("exemple@exemple.com", text: $email)
                .textFieldStyle(.roundedBorder)
            Text("Nom")
                .font(.callout).bold()
            TextField("Guillaume", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Mot de passe")
                .font(.callout).bold()
            SecureField("mot de passe", text: $passeword)
                .textFieldStyle(.roundedBorder)
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
            NavigationLink(destination: HomePageView(recipeList: recipeTab, marecette: arepa), label: {
                Text("Valider")
            })
                    .buttonStyle(.borderedProminent)
                        .tint(.black)
            }
        .padding(.all, 36)
        .navigationTitle("Inscription")
    }
}


struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView()
    }
}


struct Ingredient2{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
}
