//
//  PreparationView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct PreparationView: View {
    @State var recette: String = ""
    @State var indications: String = ""
    @State var preparationSpagueti: String = ""
    @State var searchText: String = ""
    var recipeList: [Recipe] = recipeTab
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @State var isActive:Bool = false
    var chefList: [Chef] = chefTab
    var marecette: Recipe
    @State var addingRecipe = false
    var monUser: User
    var newRecipe = ""
    @State var selectedPicker = "Ingrédients"
    @State var ingrédientsButton = true
//    init() {
//            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(.blue).opacity(0.7))
//
//            let attibutes: [NSAttributedString.Key:Any] = [
//                .foregroundColor : UIColor(.white)
//            ]
//            UISegmentedControl.appearance().setTitleTextAttributes(attibutes, for: .selected)
//        }
    
    var body: some View {
           VStack (alignment: .leading){
               NavigationLink(destination: ChefView(monchef: marecette.chef, recipeList: recipeTab, monUser: user1, marecette: arepa) ) {
                   VStack{
                       HStack {
                           Text("\(marecette.chef.prenom)")
                           Text("\(marecette.chef.nameChef)")
                               
                       }
                       .font(.system(size: 20))
                           .foregroundColor(Color("GeneralColor"))
                           .padding()
                           .font(.title)
                   Text(marecette.country)
                       Image(systemName: "mappin.and.ellipse")
                           .frame(maxWidth: .infinity, alignment: .center)
                   }
               }
                            
                VideoView(videoID: marecette.video)
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(0)
                    .padding(.horizontal, 16/9)
                .font(.title)
                .padding()
                    .font(.title)
               Text("Pour 2 personnes").bold()
                   .font(.system(size: 20))
                   .padding()
               Picker(selection: $selectedPicker, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                   Text("Ingrédients").tag("Ingrédients")

                   Text("Détails").tag("Détails")
               }
               .padding()
               .frame(height: 60)
               .pickerStyle(.segmented)
               .scaledToFit()
               .scaleEffect(CGSize(width: 1, height: 1.4))
               .colorMultiply(colorSelect(selected: selectedPicker))
               
               
               if selectedPicker == ("Ingrédients"){
                   HStack {
                       List{
                           ForEach(marecette.ingredientsRecipe, id: \.self) {ingredient in
                           Text(ingredient)
                               }
                            }
                       .listStyle(.plain)
                       List{
                           ForEach(marecette.quantity, id: \.self) { list in
                               Text(list)
                           }
                       }
                       .listStyle(.plain)
                   }
               }else {
                   DetailsStepsRecipe(stepsRecipeView: marecette)
               }
               }
                Spacer()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text(marecette.nameRecipe)
                        .font(.system(size: 30))
                }
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
        HStack {
           
            Link(destination: URL(string: "https://gourmet.galerieslafayette.com")!) {
                Text("JE COMMANDE")
                    .foregroundColor(Color("GeneralColor"))
                
            }
        }
    }
        }
    

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView(marecette: kukuSabzi, monUser: user1)
    }
}

func colorSelect (selected: String)-> Color {
    switch selected{
case "Ingrédients":
    
        return Color ("GeneralColor")
    
default : return Color ("GeneralColor")
    
    }
}
