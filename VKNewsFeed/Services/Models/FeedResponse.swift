//
//  FeddResponse.swift
//  VKNewsFeed
//
//  Created by username on 18.10.2021.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CoutableItem?
    let likes: CoutableItem?
    let reposts: CoutableItem?
    let views: CoutableItem?
}

struct CoutableItem: Decodable {
    let count: Int
}

protocol ProfileRepresenatable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profile: Decodable, ProfileRepresenatable {
    
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String { return firstName + " " + lastName}
    var photo: String { return photo100 }
}

struct Group: Decodable, ProfileRepresenatable {
    
    let id: Int
    let name: String
    let photo100: String
    
    var photo: String { return photo100 }
}
