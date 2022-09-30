//
//  ListMealCountryView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct ListMealCountryView: View {
    var recipeList : [Recipe]
    var body: some View {
        List{
            ForEach(recipeList){list in
                NavigationLink(destination: PreparationView(marecette: list, monUser: user1)){
                    Image(list.imgRecipe)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.red, lineWidth: 2))
                            .foregroundColor(Color("GeneralColor"))
                            .padding()
                    Text(list.nameRecipe)
                }
            }
        }
    }
}

struct ListMealCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ListMealCountryView(recipeList: recipeTab)
    }
}
