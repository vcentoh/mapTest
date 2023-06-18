//
//  LoginView.swift
//  RidderyMap
//
//  Created by Magik on 17/6/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            Circle()
                .scale(1.9)
                .foregroundColor(.white.opacity(0.25))
            Circle()
                .scale(1.3)
                .foregroundColor(.white)
            VStack {
                Text("Ingresa tus datos!")
                    .padding(17)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Form {
                    TextField("Correo", text: $mail)
                    TextField("Contraseña", text: $password)
                    
                }.frame(height: 170)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding()
                
                NavigationLink {
                    HomeView().navigationBarHidden(true)
                } label: {
                    Text("Continuar").styledLinkLabel(with: LinearGradient(colors: [.cyan,.black], startPoint: .topTrailing, endPoint: .bottomLeading))
                }.padding(25)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
