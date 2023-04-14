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

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var view2: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        searchView.layer.cornerRadius = 20
        
        view2?.layer.cornerRadius = 20
        view2?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        searchAction(textInput)
    }
    
    @IBAction func backAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "TabBarViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
        SceneDelegate.shared?.changeRootController(vc)
    }
    
    func searchAction(_ sender: UITextInput){
        delegate?.searchAction()
    }
}
