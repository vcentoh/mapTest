//
//  SwiftUIView.swift
//  RidderyMap
//
//  Created by Magik on 16/6/23.
//

import SwiftUI
import GoogleMaps

struct MapView: View {
    @State private var showingMenu = false

    var body: some View {
        ZStack {
            MapViewRepresentable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    
                    Button(action: {self.showingMenu.toggle()}) {
                        Image(systemName: "line.horizontal.3.circle.fill")
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(.white.opacity(0.8))
                            .frame(width: 50.0, height: 50.0)
                            .padding()
                        Spacer()
                    }

                }
                Spacer()
            }
        }
        .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
        .animation(.easeInOut(duration: 0.5))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
