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
   
    let SQLITE_Transient = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
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
    
    
    func loginCheck(data: UserModel) {
        
            let insertStatement = "SELECT * FROM USER WHERE (correo = ?) AND (password,?);"
            var insertQuery: OpaquePointer?
            
            if sqlite3_prepare_v2(dbPointer, insertStatement, -1, &insertQuery, nil) == SQLITE_OK {
                sqlite3_bind_text(insertQuery, 1, data.mail, -1, SQLITE_Transient)
                sqlite3_bind_text(insertQuery, 1, data.password, -1, SQLITE_Transient)
            }
        }
    
    func registerUser(mail: String, password: String, nombre: String) {
        let insertStatement = "SELECT FROM USER (correo, password, nombre) VALUES (?,?,?);"
        var insertQuery: OpaquePointer?
        
        if sqlite3_prepare_v2(dbPointer, insertStatement, -1, &insertQuery, nil) == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, mail, -1, SQLITE_Transient)
            sqlite3_bind_text(insertQuery, 1, password, -1, SQLITE_Transient)
            sqlite3_bind_text(insertQuery, 1, nombre, -1, SQLITE_Transient)
        }
    }
}
