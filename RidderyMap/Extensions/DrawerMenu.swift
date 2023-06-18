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
    var body: some View {
        List(menu) { menuItem in
            MenuCell(menuItem: menuItem).onTapGesture {}
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
