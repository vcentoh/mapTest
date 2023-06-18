//
//  ContentView.swift
//  RidderyMap
//
//  Created by Magik on 15/6/23.
//

import SwiftUI

struct LandingView: View {
    

    @State private var showLogin = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.9)
                    .foregroundColor(.white.opacity(0.25))
                Circle()
                    .scale(1.3)
                    .foregroundColor(.white)
                
                VStack {
                    Image("Title")
                        .frame(width: 70, height: 70)
                        .scaledToFit()
                        .foregroundColor(.accentColor)
                        .shadow(radius: 15)
                        .padding(50)
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Registrate!").styledLinkLabel(with: LinearGradient(colors: [.green,.blue], startPoint: .topTrailing, endPoint: .bottomLeading))
                    }.padding(25)
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Ingresa!").styledLinkLabel(with: LinearGradient(colors: [.cyan,.green], startPoint: .topTrailing, endPoint: .bottomLeading))
                    }

                }
                .padding()
            }
        }.toolbar(.hidden)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
