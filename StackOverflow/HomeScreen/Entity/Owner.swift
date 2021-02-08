//
//  Owner.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

struct Owner: Codable {
    let reputation: Int
    let userType: String
    let profileImage: String
    let displayName: String
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case reputation
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reputation = try values.decode(Int.self, forKey: .reputation)
        userType = try values.decode(String.self, forKey: .userType)
        profileImage = try values.decode(String.self, forKey: .profileImage)
        link = try values.decode(String.self, forKey: .link)
        displayName = try values.decode(String.self, forKey: .displayName)
    }
}
