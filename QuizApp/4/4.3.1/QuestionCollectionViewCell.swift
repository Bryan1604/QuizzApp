//
//  QuestionCollectionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 4/4/23.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCell.layer.cornerRadius = 15
    }

}
