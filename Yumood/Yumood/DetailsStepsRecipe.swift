//
//  DetailsStepsRecipe.swift
//  Yumood
//
//  Created by apprenant75 on 26/09/2022.
//

import SwiftUI

struct DetailsStepsRecipe: View {
    var stepsRecipeView : Recipe
    
    
    var body: some View {
        
        VStack {
            List{Text(stepsRecipeView.stepsRecipe)
                
           
        }
    }
}
}
struct DetailsStepsRecipe_Previews: PreviewProvider {
    static var previews: some View {
        DetailsStepsRecipe(stepsRecipeView: arepa)
    }
}
