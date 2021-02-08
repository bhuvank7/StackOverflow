//
//  HomeScreenProtocols.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation
import UIKit

protocol ViewToPresenterHomeScreenProtocol: class {
    var view: PresenterToViewHomeProtcol? {get set}
    var interactor: PresenterToInteractorHomeScreenProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func startFetchingHomeScreenData()
}

protocol PresenterToViewHomeProtcol: class {
    func onHomeScreenResponseSuccess(homeScreenItems: [StackOverflowItems])
    func onHomeScreenResponseFailed(error: String)
}

protocol PresenterToRouterHomeProtocol:class {
    static func createDetailsModule()-> UIViewController
}


protocol PresenterToInteractorHomeScreenProtocol:class {
    var presenter: InteractorToPresenterHomeScreenProtocol? {get set}
    func fetchHomeScreenData()
}

protocol InteractorToPresenterHomeScreenProtocol:class {
    func homeScreenDataFetchSuccess(homeScreenItems: [StackOverflowItems])
    func homeScreenDataFetchFailed()
}
