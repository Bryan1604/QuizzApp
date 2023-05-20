//
//  testCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/21/23.
//

import UIKit

class testCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var parentTitle: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var detailBtn: UIButton!
    
    var id: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        parentView.layer.cornerRadius = 20
        parentView.layer.borderWidth = 2
        parentView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
