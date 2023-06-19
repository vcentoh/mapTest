//
//  DrawerMenu.swift
//  RidderyMap
//
//  Created by Magik on 18/6/23.
//

import Foundation
import SwiftUI

let menuHome = MenuContent(name: "Home", image: "house.fill")
let menuProfile = MenuContent(name: "Profile", image: "person.fill")
let menuLogout = MenuContent(name: "Logout", image: "power")
let menuContents = [menuHome, menuProfile, menuLogout]

struct ContentMenuView: View {
    var menu: [MenuContent] = menuContents
    @State var menuItemSelected: MenuContent = menuContents[0]
    
    var body: some View {
        ZStack {
            List(menu) { menuItem in
                MenuCell(menuItem: menuItem).onTapGesture {
                    self.menuItemSelected = menuItem }
            }
            self.selected(Menu: menuItemSelected)
        }
    }
    
    func selected(Menu: MenuContent) -> some View {
        switch Menu.name {
        case "Home":
            return AnyView(MapView())
            
        case "Profile":
            return AnyView(ProfileView())
            
        case "Logout":
            return AnyView(LandingView())
        default:
            return AnyView(MapView())
        }
    }
}

struct MenuCell: View {
    var menuItem: MenuContent = menuContents[0]
    var body: some View {
        HStack {
            Image(systemName: menuItem.image)
                .foregroundColor(
                    .orange)
            Text(menuItem.name)
                .foregroundColor(
                    .orange)
        }
    }
 }

class MenuContent: Identifiable, ObservableObject {
    var id = UUID()
    var name: String = ""
    var image: String = ""
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}


struct TargetView: View {
    @State private var showingMenu = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(
                .all)
            VStack(alignment: .leading) {
                Button(action: { self.showingMenu.toggle() }) {
                    Image(systemName: "line.horizontal.3.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(.white)
                }
                .frame(width: 50.0, height: 50.0)
                Spacer()
                Text("TARGET here")
                    .font(
                        .largeTitle)
                    .foregroundColor(
                        .white)
                    .frame(maxWidth: .infinity)
                Spacer()
            }.padding(.horizontal) .frame(maxWidth: .infinity)
        }
        .offset(x: showingMenu ? 200.0 : 0.0, y: 0)
        .animation(.easeOut)
    }
}
