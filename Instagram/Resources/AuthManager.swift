//
//  AuthManager.swift
//  Instagram
//
//  Created by Ray Chang on 2024/3/6.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String) {
        /*
         - Check if username is available
         - Check if email is available
         - Creat account
         - Insert account to database
         */
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // Username log in
            print(username)
        }
    }
    
}
