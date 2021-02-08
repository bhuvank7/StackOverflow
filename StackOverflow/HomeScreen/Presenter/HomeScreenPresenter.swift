//
//  HomeScreenPresenter.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation

class HomeScreenPresenter: ViewToPresenterHomeScreenProtocol {
    var view: PresenterToViewHomeProtcol?
    
    var interactor: PresenterToInteractorHomeScreenProtocol?
    
    var router: PresenterToRouterHomeProtocol?
    
    func startFetchingHomeScreenData() {
        interactor?.fetchHomeScreenData()
    }
}

extension HomeScreenPresenter: InteractorToPresenterHomeScreenProtocol {
    func homeScreenDataFetchSuccess(homeScreenItems: [StackOverflowItems]) {
        view?.onHomeScreenResponseSuccess(homeScreenItems: homeScreenItems)
    }
    
    func homeScreenDataFetchFailed() {
        view?.onHomeScreenResponseFailed(error: Constants.FETCH_HOME_SCREEN_ERROR)
    }
}
