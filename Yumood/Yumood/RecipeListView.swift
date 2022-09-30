//
//  RecipeListView.swift
//  Yumood
//
//  Created by Guillaume DemergÃ¨s on 27/09/2022.
//

import SwiftUI

struct RecipeListView: View {
    var recipeList:[Recipe] = recipeTab
    
    let columns = [
            GridItem(.flexible())
        ]
    
    var body: some View {
        ScrollView{
            
        LazyVGrid(columns: columns, spacing: 20){
            ForEach(recipeList) { list in
                HStack {
                    NavigationLink(destination: PreparationView(marecette: list, monUser: user1)){
                        VStack (alignment: .leading){
                                Image(list.imgRecipe)
                                    .resizable()
                                .frame(width: 360, height: 250)
                                .cornerRadius(10)
                            
                            Text(list.nameRecipe).bold()
                                .font(.system(size: 18))
                                HStack {
                                Text(list.chef.prenom)
                                Text(list.chef.nameChef)
                                }.font(.system(size: 15))
                            Text(list.country)
                                .font(.system(size: 14))
                        }.foregroundColor(.black)
                    }
                }
            }
        }.navigationTitle("Nos recettes")

    }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
