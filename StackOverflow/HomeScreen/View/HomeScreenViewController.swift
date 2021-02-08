//
//  ViewController.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet private weak var questionsTableView: UITableView!
    var homeScreenPresenter: ViewToPresenterHomeScreenProtocol?
    private var homeScreenItems: [StackOverflowItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.HOMESCREE_PAGE_TITLE
        loadingView.startAnimating()
        homeScreenPresenter?.startFetchingHomeScreenData()
        
        registerTableViewCells()
        questionsTableView.dataSource = self
        questionsTableView.delegate = self
    }
    
    private func registerTableViewCells() {
        questionsTableView.register(UINib(nibName: CellIdentifiers.QUESTIONS_CELL_IDENTIFIER, bundle: nil), forCellReuseIdentifier: CellIdentifiers.QUESTIONS_CELL_IDENTIFIER)
        questionsTableView.tableFooterView = UIView()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.QUESTIONS_CELL_IDENTIFIER) as? QuestionsCell else {
            return UITableViewCell()
        }
        cell.setViewData(with: homeScreenItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeScreenViewController: PresenterToViewHomeProtcol {
    func onHomeScreenResponseSuccess(homeScreenItems: [StackOverflowItems]) {
        self.homeScreenItems = homeScreenItems
        questionsTableView.reloadData()
        loadingView.isHidden = true
    }
    
    func onHomeScreenResponseFailed(error: String) {
        let alert = UIAlertController(title: Constants.ALERT,
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.OK_BUTTON,
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
