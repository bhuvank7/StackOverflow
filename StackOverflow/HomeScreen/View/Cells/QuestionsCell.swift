//
//  QuestionsCell.swift
//  StackOverflow
//
//  Created by Bhuvana Chandra on 08/02/21.
//

import UIKit

class QuestionsCell: UITableViewCell {

    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var viewsLabel: UILabel!
    @IBOutlet private weak var upVoteLabel: UILabel!
    @IBOutlet private weak var creationDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setViewData(with data: StackOverflowItems) {
        viewsLabel.text = String(data.viewsCount)
        titleLabel.text = data.title
        upVoteLabel.text = String(data.score)
        authorLabel.text = data.owner.displayName
        creationDateLabel.text = data.creationDate.getDateStringFromUTC()
    }
}
