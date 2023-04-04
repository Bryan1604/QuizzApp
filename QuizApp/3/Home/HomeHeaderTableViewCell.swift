//
//  HomeHeaderTableViewCell.swift
//  QuizApp
//
//  Created by Nghĩa Nguyễn on 3/13/23.
//

import UIKit
protocol HomeHeaderTableViewCellDelegate: AnyObject{
    func didTapLabel()
}

class HomeHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var avatar: UIImageView?
    @IBOutlet weak var findID: UIButton?
    @IBOutlet weak var childView: UIView?
    @IBOutlet weak var headerList: UIView?
    
    @IBOutlet weak var systemBtn: UIButton?
    @IBOutlet weak var userBtn: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        childView?.layer.cornerRadius = 20
        childView?.backgroundColor = .white.withAlphaComponent(0.2)
        findID?.layer.cornerRadius = 20
        
        headerList?.layer.cornerRadius = 20
        headerList?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        // Initialization code
        
        systemBtn?.layer.opacity = 0.3
        userBtn?.layer.opacity = 0.3
    }
    
}
