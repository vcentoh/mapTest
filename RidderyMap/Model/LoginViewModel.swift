//
//  LoginViewModel.swift
//  RidderyMap
//
//  Created by Magik on 19/6/23.
//

import Foundation
import SQLite3
import SQLite

class LoginViewModel: ObservableObject {
    @Published var credentials = UserModel()
    @Published var showProgress = false
    
    var loginDisabled: Bool {
        credentials.mail.isEmpty || credentials.passwrod.isEmpty
    }
    
    func login(completion: @escaping(Bool) -> Void) {
        showProgress = true
        
    }
}
