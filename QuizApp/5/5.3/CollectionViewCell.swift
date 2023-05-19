//
//  CollectionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var number: UILabel!
    var id: Int?
    
    var select: Bool = false {
        didSet{
            setSelect()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 25
        // Initialization code
    }
    
    func setSelect() {
        if select {
            cellView.backgroundColor =  UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
            number.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        } else {
            cellView.backgroundColor =  .clear
            number.textColor = UIColor(red: 133/255, green: 132/255, blue: 148/255, alpha: 1)
        }
    }


}
