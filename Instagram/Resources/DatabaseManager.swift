//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Ray Chang on 2024/3/6.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    // MARK: - Public
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        
    }
}
