//
//  RidderyMapApp.swift
//  RidderyMap
//
//  Created by Magik on 15/6/23.
//

import SwiftUI
import GoogleMaps

@main
struct RidderyMapApp: App {
    
    init() {
        GMSServices.provideAPIKey()
    }
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
