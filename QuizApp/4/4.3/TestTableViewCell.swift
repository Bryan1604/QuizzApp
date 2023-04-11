//
//  TestTableViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var cellView: UIView!
//    @IBOutlet weak var delete: UILabel!
//    @IBOutlet weak var edit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        cellView.layer.cornerRadius = 20
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor = UIColor.systemGray5.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
