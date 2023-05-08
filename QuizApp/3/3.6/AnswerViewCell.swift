//
//  AnswerViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 4/24/23.
//

import UIKit

class AnswerViewCell: UITableViewCell {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var content: UILabel!
    var select: Bool = false {
        didSet {
            setSelect()
        }
    }
    var id: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subView.layer.cornerRadius = 20
        subView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 0.85).cgColor
        subView.layer.borderWidth = 2

        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSelect() {
        if select {
            contentView.viewWithTag(1)?.backgroundColor =  UIColor(red: 99/255, green: 156/255, blue: 253/255, alpha: 0.2)
        } else {
            contentView.viewWithTag(1)?.backgroundColor =  .clear
        }
        
    }
    
}
