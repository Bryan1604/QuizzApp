//
//  RulesViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 17/02/2023.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var returnBtn: UIButton?
    @IBOutlet weak var textLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonProperty(button: returnBtn!)
        setLabelProperty(label: textLabel!)
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    
    func setLabelProperty(label: UILabel) {
        label.layer.opacity = 0.5
    }
    
    @IBAction func didTapReturnBtn(){
        navigationController?.popViewController(animated: true)
    }

}
