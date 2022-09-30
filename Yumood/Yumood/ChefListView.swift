//
//  ChefListView.swift
//  Yumood
//
//  Created by Guillaume DemergÃ¨s on 27/09/2022.
//

import SwiftUI

struct ChefListView: View {
    var chefList:[Chef] = chefTab
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(chefList) { list in
                HStack {
                    NavigationLink(destination: ChefView(monchef: list, recipeList: recipeTab, monUser: user1, marecette: arepa)){
                        VStack {
                            Image(list.pictureChef)
                                .resizable()
                                .scaledToFill()
                            .frame(width: 100, height: 100)
                        .clipShape(Capsule())
                            Text(list.prenom)
                            Text(list.nameChef)
                        }
                    }
                }
            }
        }
        .navigationTitle("Nos chefs")
    }
}

struct ChefListView_Previews: PreviewProvider {
    static var previews: some View {
        ChefListView()
    }
}
