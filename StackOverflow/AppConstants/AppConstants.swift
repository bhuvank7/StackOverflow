//
//  AppConstants.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

struct NetworkCalls {
    static let FETCH_HOME_SCREEN_DATA = "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow"
}

struct Constants {
    static let HOMESCREE_PAGE_TITLE = "StackOverflow Questions"
    static let FETCH_HOME_SCREEN_ERROR = "Unable to fetch home screen data"
    static let ALERT = "Alert"
    static let OK_BUTTON = "Ok"
}
