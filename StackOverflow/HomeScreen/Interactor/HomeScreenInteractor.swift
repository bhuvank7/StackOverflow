//
//  HomeScreenInteractor.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import Foundation
import Alamofire

class HomeScreenInteractor: PresenterToInteractorHomeScreenProtocol {
    
    var presenter: InteractorToPresenterHomeScreenProtocol?
    
    func fetchHomeScreenData() {
        AF.request(NetworkCalls.FETCH_HOME_SCREEN_DATA).responseJSON { responseData in
            if let data = responseData.data {
                let jsonDecoder =   JSONDecoder.init()
                do {
                    let responseModel = try jsonDecoder.decode(HomeScreenModel.self, from: data)
                    let homeScreenItems = responseModel.items.filter { (items) -> Bool in
                        items.is_answered
                    }
                    self.presenter?.homeScreenDataFetchSuccess(homeScreenItems: homeScreenItems)
                } catch {
                    self.presenter?.homeScreenDataFetchFailed()
                }
            } else {
                self.presenter?.homeScreenDataFetchFailed()
            }
        }
    }
}
