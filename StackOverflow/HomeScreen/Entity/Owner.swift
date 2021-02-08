//
//  Owner.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

struct Owner: Codable {
    let reputation: Int
    let user_id: Int
    let user_type: String
    let accept_rate: Int
    let profile_image: String
    let display_name: String
    let link: String
}
