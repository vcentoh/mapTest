//
//  SwiftUIView.swift
//  RidderyMap
//
//  Created by Magik on 16/6/23.
//

import SwiftUI
import GoogleMaps

struct HomeView: View {
    
    @State private var showingMenu = true
    var body: some View {
        ZStack {
            MapViewRepresentable()
                .ignoresSafeArea()
            VStack {
                ZStack(alignment: .top){
                    Circle()
                        .frame(width: 50,height: 50)
                        .foregroundColor(.white)
                    Button(action:  {self.showingMenu.toggle()}) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.green)
                            .scaledToFill()
                    }
                    .scaledToFill()
                    .frame(width: 50.0, height: 50.0)
                    .shadow(radius: 20)
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
