//
//  SubjectCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/20/23.
//

import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var detailBtn: UIButton!
    
    var id: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        parentView.layer.cornerRadius = 20
        parentView.layer.borderWidth = 2
        parentView.layer.borderColor = UIColor.systemGray5.cgColor

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
