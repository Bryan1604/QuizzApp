//
//  CollectionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/26/23.
//

import UIKit

class QuestionCollectionCell: UICollectionViewCell {

    @IBOutlet weak var questionCell : UIView?
    @IBOutlet weak var numberOfQuestion: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        questionCell?.layer.cornerRadius = 15
        questionCell?.backgroundColor = .white
        questionCell?.layer.borderWidth = 1.5
        questionCell?.layer.borderColor = .init(red: 106, green: 90, blue: 224, alpha: 0.2)
    }
}
