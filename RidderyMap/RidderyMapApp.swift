//
//  RidderyMapApp.swift
//  RidderyMap
//
//  Created by Magik on 15/6/23.
//

import SwiftUI
import GoogleMaps

var dbPointer: OpaquePointer?

@main
struct RidderyMapApp: App {
    
    init() {
        if let pointer = DataManager.getDatabasePointer(databaseName: "Iskander.db") {
            dbPointer = pointer
        }
    }
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
