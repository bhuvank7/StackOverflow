//
//  HomeScreenModel.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

struct HomeScreenModel: Codable {
    let items: [StackOverflowItems]
}

struct StackOverflowItems: Codable {
    let owner: Owner
    let is_answered: Bool
    let view_count: Int
    let answer_count: Int
    let link: String
    let title: String
}
