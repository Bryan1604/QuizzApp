//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonProperty(button: signUpBtn!)
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    
}
