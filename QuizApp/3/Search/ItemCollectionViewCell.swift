//
//  ItemCollectionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/17/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var count: UILabel!
    
    var id: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemView.layer.cornerRadius = 20
    }

}
