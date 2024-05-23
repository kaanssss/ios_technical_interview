//
//  Post.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

struct Post: Decodable {
    
    // MARK: - Properties
    let id: String
    let createdAt: Date
    let content: String
    let options: [Option]
    let user: User
    var votes: Int?
    var isLiked: Bool?
    
    init(id: String, createdAt: Date, content: String, options: [Option], user: User, votes: Int, isLiked: Bool) {
            self.id = id
            self.createdAt = createdAt
            self.content = content
            self.options = options
            self.user = user
            self.votes = votes
            self.isLiked = isLiked
        }
}
