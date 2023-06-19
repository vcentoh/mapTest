//
//  RegisterView.swift
//  RidderyMap
//
//  Created by Magik on 17/6/23.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Circle()
                .scale(1.9)
                .foregroundColor(.green.opacity(0.25))
            Circle()
                .scale(1.3)
                .foregroundColor(.green)
            VStack {
                Text("Ingresa tus datos!")
                    .padding(17)
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Form {
                    TextField("Correo", text: $mail)
                    TextField("Contraseña", text: $password)
                    
                }.frame(height: 170)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding()
                
                NavigationLink {
                    MapView().navigationBarHidden(true)
                } label: {
                    Text("Continuar").styledLinkLabel(with: LinearGradient(colors: [.green,.blue], startPoint: .topTrailing, endPoint: .bottomLeading))
                }.padding(25)
                
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
