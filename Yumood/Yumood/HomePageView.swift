//
//  HomePageView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//
// page do by Guillame
import SwiftUI

struct HomePageView: View {
    @State var searchText: String = ""
    var recipeList:[Recipe]
    @State var isActive:Bool = false
    var continentList:[Continent] = continentTab
    var chefList:[Chef] = chefTab
    var monUser:User = user1
    @State var addingRecipe = false
    @State var marecette: Recipe
    
    var body: some View {
            VStack {
                HStack {
                    if searchText != "" {
                        List{
                            ForEach(recipeList.filter{ $0.nameRecipe.contains(searchText) || $0.country.contains(searchText)}) { list in
                                NavigationLink(destination: PreparationView(marecette: list, monUser: user1)){
                                    Text(list.nameRecipe)
                                    Text(" / ")
                                    Text(list.country)
                                }
                                .onAppear{
                                    isActive = true
                                }
                            }
                        }
                    }else if searchText == ""{
                        ScrollView{
                            VStack {
                                VStack {
                                    HStack{
                                        Text("Nos chefs").bold()
                                            .font(.system(size: 20))
                                            
                                        NavigationLink(destination: ChefListView()){
                                            Text("Voir tout")
                                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                                .font(.system(size: 13))
                                        }
                                    }.frame(maxWidth: .infinity, alignment: .topLeading)
                                        .padding()
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack {
                                            ForEach(chefList) { list in
                                                NavigationLink(destination: ChefView(monchef: list, recipeList: recipeTab, monUser: user1, marecette: arepa)){
                                                    VStack {
                                                        Image(list.pictureChef)
                                                                                                        .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 90, height: 90)
                                                            .clipShape(Capsule())
                                                        VStack {
                                                            Text(list.prenom)
                                                            Text(list.nameChef)
                                                        }
                                                    }
                                                }
                                            }.padding(.leading)
                                        }
                                    }
                                }
                                VStack (spacing: -10){
                                    HStack {
                                        Text("Juste pour vous").bold()
                                            .font(.system(size: 20))
                                        NavigationLink(destination: RecipeListView()){
                                            Text("Voir tout")
                                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                                .font(.system(size: 13))
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding()
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack (spacing: -10){
                                            ForEach(recipeList) { list in
                                                NavigationLink(destination: PreparationView(marecette: list, monUser: user1)){
                                                    VStack {
                                                        ZStack(alignment: .bottomLeading) {
                                                            Image(list.imgRecipe)
                                                                .resizable()
                                                                .frame(width: 260, height: 150)
                                                                .scaledToFit()
                                                                .cornerRadius(10)
                                                            
                                                            Rectangle()
                                                                
                                                                .fill(LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                                                                
                                                                    )
                                                                .frame(height: 110)
                                                                
                                                            Text(" \(list.time) min")
                                                                .padding(2)
                                                                .foregroundColor(.white)
                                                        }
                                                                VStack {
                                                                    Text(list.nameRecipe).bold()
                                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                    .font(.system(size: 18))
                                                                    HStack {
                                                                        Text("\(list.chef.prenom)")
                                                                            .font(.system(size: 15))
                                                                        Text("\(list.chef.nameChef)")
                                                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                        .font(.system(size: 15))
                                                                    }
                                                                    Text("\(list.country)")
                                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                    .font(.system(size: 14))
                                                                }
                                                        }
                                                        .padding()
                                                    }
                                                }
                                            }
                                        }
                                    }
                                VStack (spacing: -10){
                                    HStack {
                                        Text("Nos recettes").bold()
                                            .font(.system(size: 20))
                                        NavigationLink(destination: RecipeListView()){
                                            Text("Voir tout")
                                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                                .font(.system(size: 13))
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding()
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack (spacing: -10){
                                            ForEach(monUser.favoriteRecipe) { list in
                                                NavigationLink(destination: PreparationView(marecette: list, monUser: user1)){
                                                    VStack {
                                                        ZStack(alignment: .bottomLeading) {
                                                            Image(list.imgRecipe)
                                                                .resizable()
                                                                .frame(width: 260, height: 150)
                                                                .scaledToFit()
                                                                .cornerRadius(10)
                                                            
                                                            Rectangle()
                                                                
                                                                .fill(LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                                                                    )
                                                                .frame(height: 110)
                                                                
                                                            Text(" \(list.time) min")
                                                                .foregroundColor(.white)
                                                                .padding(2)
                                                        }
                                                                VStack {
                                                                    Text(list.nameRecipe).bold()
                                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                    .font(.system(size: 18))
                                                                    HStack {
                                                                        Text("\(list.chef.prenom)")
                                                                            .font(.system(size: 15))
                                                                        Text("\(list.chef.nameChef)")
                                                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                        .font(.system(size: 15))
                                                                    }
                                                                    Text("\(list.country)")
                                                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                                                    .font(.system(size: 14))
                                                                }
                                                        }
                                                        .padding()
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    //fin
                                }
                            }
                        }
                    }
                }
                .tint(.black)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        VStack (alignment: .leading){
                            Text("")
                            Text("Bonjour, \(user1.name)").bold()
                                .font(.system(size: 20))
                            Text("On mange quoi aujourd'hui ?")
                                .font(.system(size: 13))
                                .font(.footnote)
                            Text("")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: ProfileView(userTab: user1, monUser: user1)){
                            Image("aimé")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(Capsule())
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(recipeList: recipeTab, marecette: arepa)
    }
}
