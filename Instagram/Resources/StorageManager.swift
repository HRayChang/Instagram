//
//  StorageManager.swift
//  Instagram
//
//  Created by Ray Chang on 2024/3/6.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    // MARK: - Public
    
    private func uploadUserPost(model: UserPost, completion: (Result<URL, Error>) -> Void) {
        
    }
    
    private func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
}

public enum UserPostType {
    case photo, video
}

/// Represents a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let creatdDate: Date
    let likes: [CommentLike]
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}
