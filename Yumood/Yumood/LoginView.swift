//
//  LoginView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//

import SwiftUI

struct LoginView: View {

    var body: some View {
        NavigationView{
            VStack (spacing: 24){
                Image("image1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                
                FormBox(userList: userTab)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }.padding(.all, 36)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct FormBox: View{
    @State var email:String = ""
    @State var passeword:String = ""
    var userList:[User]
    
    var body: some View{
        VStack (alignment: .center, spacing: 15){
            Text("Email")
                .font(.callout).bold()
            TextField("exemple@exemple.com", text: $email)
                .textFieldStyle(.roundedBorder)
            Text("Password")
                .font(.callout).bold()
            SecureField("password", text: $passeword)
                .textFieldStyle(.roundedBorder)
            
            NavigationLink(destination: HomePageView(recipeList: recipeTab, marecette: arepa), label: {
                Text("Se connecter")
            })
                    .buttonStyle(.borderedProminent)
                        .tint(.black)
            NavigationLink(destination: InscriptionView()){
                Text("Vous n'avez pas de compte ?")
            }
            }
//            ForEach(userList) { list in
//                if email != list.email && passeword != list.passeword{
//                    Button("Se connecter"){
//                        //Action
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .tint(.black)
//                }else{
//                    NavigationLink {
//                        HomePageView(recipeList: recipeTab)
//                    } label: {
//                        Text("Se connecter")
//                    }.padding()
//                     .buttonStyle(.borderedProminent)
//                        .tint(.black)
//                }
//            }
        .padding(.all, 36)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
    }
}
