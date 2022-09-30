//
//  ProfileView.swift
//  }
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var user : User = user1
    var userTab: User
    @State private var isModifying = false
    @ObservedObject var monUser:User
    @State var chefOrRecipe = 0
    
    var body: some View {
            VStack (alignment: .leading){
                HStack {
                    Image("aimé")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .clipShape(Capsule())
                    Text(user.name)
                        .font(.title)
                }.padding()
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
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                    Text("")
                                    Text(i.nameRecipe)
                                }
                            }
                        }
                    }else if chefOrRecipe == 1{
                        List{
                            ForEach(monUser.listIngredients){ i in
                                NavigationLink(destination: ChefView(monchef: chefMojgan, recipeList: recipeTab, monUser: user1, marecette: kukuSabzi)){
                                    Image(i.pictureChef)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 45, height: 45)
                                        .clipShape(Capsule())
                                    HStack {
                                        Text(i.prenom)
                                        Text(i.nameChef)
                                    }
                                }
                            }
                        }
                    }
                }            }.navigationTitle("Mon profil")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(false)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            isModifying.toggle()
                        }label: {
                            Image(systemName: "square.and.pencil")
                            
                        }
                        
                    }
                }
                .sheet(isPresented: $isModifying) {
                    PersonalInformation(isModifying: $isModifying, user: user1)
                }
        
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userTab: user1, monUser: user1)
    }
}
}
