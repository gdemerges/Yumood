//
//  ChefView.swift
//  Yumood
//
//  Created by apprenant75 on 21/09/2022.
//

import SwiftUI

struct ChefView: View {
    
    var monchef : Chef
    var recipeList:[Recipe]
    @State var addingRecipe = false
    var monUser: User
    var marecette: Recipe

    

    var body: some View {
        ScrollView{
            Image(monchef.pictureChef)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Capsule())
               
                .foregroundColor(Color("GeneralColor"))
                .padding()
            HStack {
                Text("\(monchef.prenom)").bold()
                    .foregroundColor(Color("GeneralColor"))
                .font(Font.custom("Chalkboard", size: 30))
                Text("\(monchef.nameChef)").bold()
                    .foregroundColor(Color("GeneralColor"))
                .font(Font.custom("Chalkboard", size: 30))
            }.padding()
            HStack(spacing: 50){
            VStack {
                Text(monchef.itemChef[0])
                    .font(.system(size : 30))
                                                .fontWeight(.bold)
                                                .foregroundColor(.red)
                Text("Etoile")
            }//endVstack etoile
            
            VStack{
                Text(monchef.itemChef[1])
                    .font(.system(size : 30))
                                                .fontWeight(.bold)
                                                .foregroundColor(.red)
                Text("Expérience")
            }
                VStack{
                    Text(monchef.itemChef[2])
                        .font(.system(size : 30))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.red)
                    Text("Followers")
                }
            }
                 
            Spacer()

            Text(monchef.bioChef)
                .padding()
            
            VStack (spacing: -10){
                Text("Ses recettes").bold()
                        .font(.system(size: 20))
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
                                            }.foregroundColor(.black)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }

            }
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                if !addingRecipe{
                                   Button{
                                       addingRecipe.toggle()
                                       monUser.addRecipe(newRecipe: marecette)

                                   }label: {
                                       Image(systemName: "heart")
                                           .foregroundColor(Color("GeneralColor"))
                                           .frame(maxWidth: .infinity, alignment: .center)
                                   }
                               }else{
                                   Button{
                                       addingRecipe.toggle()
                                   }label: {
                                       Image(systemName: "heart.fill")
                                           .frame(width:50 , height: 50)
                                           .foregroundColor(Color("GeneralColor"))
                                           .frame(maxWidth: .infinity, alignment: .center)
                                   }
                             }
            }
        }

            }
        }

struct ChefView_Previews: PreviewProvider {
    static var previews: some View {
        ChefView(monchef: chefAmanda, recipeList: recipeTab, monUser: user1, marecette: arepa)
        }
    }
