//
//  ProfileView.swift
//  RidderyMap
//
//  Created by Magik on 16/6/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingMenu = false
    
    var body: some View {
//        ZStack {
//            Color.orange.edgesIgnoringSafeArea(
//                .all)
//            VStack(alignment: .leading) {
//                Button(action: { self.showingMenu.toggle() }) {
//                    Image(systemName: "line.horizontal.3")
//                        .foregroundColor(.white)
//                }
//                .frame(width: 50.0, height: 50.0)
//                Spacer()
//                    .font(
//                        .largeTitle)
//                    .foregroundColor(
//                        .white)
//                    .frame(maxWidth: .infinity)
//                Spacer()
//            }.padding(.horizontal) .frame(maxWidth: .infinity)
//        }
//        .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
//        .animation(.easeOut)
        ContentMenuView()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
