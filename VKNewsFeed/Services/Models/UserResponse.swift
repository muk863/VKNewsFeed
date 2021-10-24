//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by username on 24.10.2021.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
