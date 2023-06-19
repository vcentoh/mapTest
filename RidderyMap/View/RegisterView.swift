//
//  RegisterView.swift
//  RidderyMap
//
//  Created by Magik on 17/6/23.
//

import SwiftUI
import SQLite
import SQLite3

struct RegisterView: View {
    
    let SQLITE_Transient = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    @State private var mail = ""
    @State private var nombre = ""
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
                    TextField("Nombre", text: $nombre)
                    SecureField("Contraseña", text: $password)
                    
                }.frame(height: 200)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding()
                
                NavigationLink {
                    ContentMenuView().navigationBarHidden(true)
                } label: {
                    Text("Continuar").styledLinkLabel(with: LinearGradient(colors: [.green,.blue], startPoint: .topTrailing, endPoint: .bottomLeading))
                }.padding(25)
                
            }
        }
    }
    
    func registerUser() {
        let insertStatement = "SELECT FROM USER (correo, password) VALUES (?,?,?);"
        var insertQuery: OpaquePointer?
        
        if sqlite3_prepare_v2(dbPointer, insertStatement, -1, &insertQuery, nil) == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, mail, -1, SQLITE_Transient)
            sqlite3_bind_text(insertQuery, 1, password, -1, SQLITE_Transient)
            sqlite3_bind_text(insertQuery, 1, nombre, -1, SQLITE_Transient)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
