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
