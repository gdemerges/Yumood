//
//  ListCountryView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct ListCountryView: View {
    var countryList: Continent
   
    
var body: some View {
    List{
        ForEach(countryList.country){ list in
            NavigationLink(destination: ListMealCountryView(recipeList: list.recipe )){
                Text(list.nameCountry)
            }
        }
    }
       
    }//end body
}//end view

struct ListCountryView_Previews: PreviewProvider {
    static var previews: some View {
        ListCountryView(countryList: continent1)
    }
}
