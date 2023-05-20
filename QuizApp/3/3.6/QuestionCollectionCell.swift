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
    
    var select: Bool = false {
        didSet {
            setSelect()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        questionCell?.layer.cornerRadius = 15
        questionCell?.backgroundColor = .white
        questionCell?.layer.borderWidth = 1.5
        questionCell?.layer.borderColor = UIColor.init(red: 196/255, green: 208/255, blue: 251/255, alpha: 1).cgColor
    }
    
    func setSelect() {
        if select {
            questionCell?.layer.backgroundColor = UIColor(red: 196/255, green: 208/255, blue: 251/255, alpha: 1).cgColor
            numberOfQuestion?.textColor = UIColor(red: 99/255, green: 156/255, blue: 253/255, alpha: 1)
        } else{
            questionCell?.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
            numberOfQuestion?.textColor = UIColor.init(red: 196/255, green: 208/255, blue: 251/255, alpha: 1)
        }
    }
    
}
