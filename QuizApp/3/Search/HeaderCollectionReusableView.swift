//
//  HeaderCollectionReusableView.swift
//  QuizApp
//
//  Created by Luong Vu on 3/17/23.
//

import UIKit
protocol SearchDelegate: AnyObject{
    func searchAction()
}

class HeaderCollectionReusableView: UICollectionReusableView {

    weak var delegate: SearchDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func searchAction(_ sender: UIButton){
        delegate?.searchAction()
    }
}
