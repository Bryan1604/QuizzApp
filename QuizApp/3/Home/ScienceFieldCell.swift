//
//  ScieneFieldCell.swift
//  QuizApp
//
//  Created by Luong Vu on 3/16/23.
//

import UIKit

protocol ScienceFieldCellDelegate: AnyObject{
    func didTapButton()
}

class ScienceFieldCell: UITableViewCell {

    weak var delegate: ScienceFieldCellDelegate?
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var thumnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var detailBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        parentView.layer.cornerRadius = 20
        parentView.layer.borderWidth = 2
        parentView.layer.borderColor = UIColor.systemGray5.cgColor
        // Initialization code
    }
    
    @IBAction func didTapButton(_ sender: UIButton){
        // unwrapped
        guard let delegate = delegate else{
            return
        }
        
        delegate.didTapButton()
        //delegate?.didTapButton()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: false)
//
//        // Configure the view for the selected state
//    }
    
}

//extension UIColor {
//    convenience init(rgb: UInt) {
//        self.init(rgb: rgb, alpha: 1.0)
//    }
//    convenience init(rgb: UInt, alpha: CGFloat) {
//        self.init(
//            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgb & 0x0000FF) / 255.0,
//            alpha: CGFloat(alpha)
//        )
//    }
//}
