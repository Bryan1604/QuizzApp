//
//  ExamViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/30/23.
//

import UIKit

class ExamViewCell: UITableViewCell {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var grade: UILabel!
    //var status : Bool

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        subView.layer.cornerRadius = 20
        subView.layer.borderColor = UIColor.systemGray5.cgColor
        subView.layer.borderWidth = 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
