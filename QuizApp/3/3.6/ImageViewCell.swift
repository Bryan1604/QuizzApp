//
//  ImageViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 4/25/23.
//

import UIKit

class ImageViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
