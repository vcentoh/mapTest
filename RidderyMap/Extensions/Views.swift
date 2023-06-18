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
