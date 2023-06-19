//
//  Views.swift
//  RidderyMap
//
//  Created by Magik on 18/6/23.
//

import Foundation
import SwiftUI

extension Text {
    func styledLinkLabel<V: View & ShapeStyle>(with gradient: V) -> some View {
        self.fontWeight(.bold)
            .font(.title)
            .padding( 10)
            .frame(minWidth: 0, maxWidth: 250, alignment: .center)
            .background(gradient)
            .foregroundColor(.white)
            .padding(2)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(gradient, lineWidth:15)
            )
    }
}

extension Button {
    func styledButton<V: View & ShapeStyle>(with gradient: V) -> some View {
        self.fontWeight(.bold)
            .font(.title)
            .padding( 10)
            .frame(minWidth: 0, maxWidth: 250, alignment: .center)
            .background(gradient)
            .foregroundColor(.white)
            .padding(2)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(gradient, lineWidth:15)
            )
    }
}

struct NavigationButton<Destination: View, Label: View>: View {
    var action: () -> Void = { }
    var destination: () -> Destination
    var label: () -> Label
    
    @State private var isActive: Bool = false
    
    var body: some View {
        Button(action: {
            self.action()
            self.isActive.toggle()
        }) {
            self.label()
                .background(
                    ScrollView { // Fixes a bug where the navigation bar may become hidden on the pushed view
                        NavigationLink(destination: LazyDestination { self.destination() },
                                       isActive: self.$isActive) { EmptyView() }
                    }
                )
        }
    }
}

// This view lets us avoid instantiating our Destination before it has been pushed.
struct LazyDestination<Destination: View>: View {
    var destination: () -> Destination
    var body: some View {
        self.destination()
    }
}
