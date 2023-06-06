//
//  User.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 06.06.2023.
//

import Foundation
class User {
    private let email: String?
    private let password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
