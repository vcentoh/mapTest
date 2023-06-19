//
//  ContentMenuView.swift
//  RidderyMap
//
//  Created by Magik on 19/6/23.
//

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
            HStack {
                List(menu) { menuItem in
                    MenuCell(menuItem: menuItem).onTapGesture {
                        self.menuItemSelected = menuItem }
                }
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

struct ContentMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMenuView()
    }
}
