//
//  ViewController.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet private weak var questionsTableView: UITableView!
    private var homeScreenPresenter: ViewToPresenterHomeScreenProtocol?
    private var homeScreenItems: [StackOverflowItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.HOMESCREE_PAGE_TITLE
        homeScreenPresenter?.startFetchingHomeScreenData()
        
        questionsTableView.dataSource = self
        questionsTableView.delegate = self
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeScreenItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeScreenViewController: PresenterToViewHomeProtcol {
    func onHomeScreenResponseSuccess(homeScreenItems: [StackOverflowItems]) {
        self.homeScreenItems = homeScreenItems
    }
    
    func onHomeScreenResponseFailed(error: String) {
        let alert = UIAlertController(title: Constants.ALERT,
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.HOMESCREE_PAGE_TITLE,
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
