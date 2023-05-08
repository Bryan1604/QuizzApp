//
//  HeaderQuestionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 4/25/23.
//

import UIKit

class HeaderQuestionViewCell: UITableViewCell {

    @IBOutlet weak var numberOfQuetion: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
