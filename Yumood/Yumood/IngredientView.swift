//
//  IngredientView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct IngredientView: View {
    
    var stepsPreparation : Recipe
    
    var body: some View {
        ScrollView{
            Image(stepsPreparation.stepsRecipe)
            Spacer()
                .foregroundColor(Color("GeneralColor"))
        }.navigationTitle(stepsPreparation.nameRecipe)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(stepsPreparation: arepa)
    }
}
