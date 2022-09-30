//
   //  ListRecipeView.swift
   //  Yumood
   //
   //  Created by apprenant75 on 20/09/2022.
   //

   import SwiftUI

   struct ListRecipeView: View {
       var maRecette : Recipe
       
       var body: some View {
           VStack {
               List {
                   ForEach(maRecette.ingredientsRecipe, id: \.self) {ingredient in
                   Text(ingredient)
               }
               }
           Spacer()
           Text("Bonne PrÃ©paration")
       }
   }
   }


   struct ListRecipeView_Previews: PreviewProvider {
       static var previews: some View {
           ListRecipeView(maRecette: arepa)
       }
   }
