//
//  File.swift
//  RidderyMap
//
//  Created by Magik on 18/6/23.
//

import Foundation
import Alamofire
import SQLite
import SQLite3

class DataManager {
   
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        var dbPointer: OpaquePointer?
        let dbPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(databaseName).path()
        if FileManager.default.fileExists(atPath: dbPath) {
            print("Db already exists")
        } else  {
            guard let bundleDB = Bundle.main.resourceURL?.appendingPathComponent("Iskander.db") else {
                print("Unwraping Error, bundle db doesnt exist")
                return nil
            }
        }
        
        if sqlite3_open(dbPath, &dbPointer) == SQLITE_OK {
            print("Connection Success")
        } else {
            print("Connection Failure ")
        }
        return dbPointer
    }
}
