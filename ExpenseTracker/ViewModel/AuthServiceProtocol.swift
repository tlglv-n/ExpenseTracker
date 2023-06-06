//
//  AuthServiceProtocol.swift
//  ExpenseTracker
//
//  Created by Nurikk T. on 06.06.2023.
//

import Foundation
import Firebase

protocol AuthServiceProtocol {
    func createUser(withEmail: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func signIn(withEmail: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signOut() throws
}
