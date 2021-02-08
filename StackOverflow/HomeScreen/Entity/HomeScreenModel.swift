//
//  HomeScreenModel.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

struct HomeScreenModel: Codable {
    let items: [StackOverflowItems]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decode([StackOverflowItems].self, forKey: .items)
    }
}

struct StackOverflowItems: Codable {
    let owner: Owner
    let isAnswered: Bool
    let viewsCount: Int
    let score: Int
    let answersCount: Int
    let link: String
    let title: String
    let creationDate: Double
    
    enum CodingKeys: String, CodingKey {
        case owner
        case isAnswered = "is_answered"
        case viewsCount = "view_count"
        case answersCount = "answer_count"
        case link
        case title
        case score
        case creationDate = "creation_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        owner = try values.decode(Owner.self, forKey: .owner)
        isAnswered = try values.decode(Bool.self, forKey: .isAnswered)
        viewsCount = try values.decode(Int.self, forKey: .viewsCount)
        score = try values.decode(Int.self, forKey: .score)
        answersCount = try values.decode(Int.self, forKey: .answersCount)
        link = try values.decode(String.self, forKey: .link)
        title = try values.decode(String.self, forKey: .title)
        creationDate = try values.decode(Double.self, forKey: .creationDate)
    }
}
