//  FavoriteRecipe.swift
//  Yumood
//
//  Created by Guillaume DemergÃ¨s on 23/09/2022.
//

import SwiftUI

struct FavoriteRecipe: View {
    @ObservedObject var monUser:User
    @State private var chefOrRecipe = 0
    
    var body: some View {
        VStack {
            Picker("test", selection: $chefOrRecipe){
                Text("Recettes favorites").tag(0)
                Text("Chef favoris").tag(1)
            }
            .pickerStyle(.segmented)
            if chefOrRecipe == 0{
                List{
                    ForEach(monUser.favoriteRecipe){ i in
                        NavigationLink(destination: PreparationView(marecette: i, monUser: user1))
                        {
                            Image(i.imgRecipe)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text(i.nameRecipe)
                        }
                    }
                }
            }else if chefOrRecipe == 1{
                List{
                    
                }
            }
        }.navigationTitle("Mes favoris")
    }
}

struct FavoriteRecipe_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipe(monUser: user1)
    }
}
