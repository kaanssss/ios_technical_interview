//
//  PostProvider.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import Foundation

class PostProvider {
    
    // MARK: - Properties
    static let shared = PostProvider(fileName: "posts")
    private let filename: String
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }()
    
    // MARK: - Life Cycle
    private init(fileName: String) {
        self.filename = fileName
    }
    
    // MARK: - Methods
    func fetchAll(completion: @escaping (Result<[Post], Error>) -> Void) {
        guard let fileUrl = Bundle.main.url(forResource: filename, withExtension: "json") else {
            completion(.failure(NSError(domain: "JSON file not found.", code: 0)))
            return
        }
        
        guard let postData = try? Data(contentsOf: fileUrl) else {
            completion(.failure(NSError(domain: "Could not read the data.", code: 1)))
            return
        }
        
        do {
            let posts = try decoder.decode([Post].self, from: postData)
            //Rastgele sayı, like...
            let updatedPosts = posts.map { post in
                Post(id: post.id, createdAt: post.createdAt, content: post.content, options: post.options, user: post.user, votes: Int.random(in: 0...100), isLiked: false)
            }
            completion(.success(posts))
        } catch {
            completion(.failure(error))
        }
    }
}
