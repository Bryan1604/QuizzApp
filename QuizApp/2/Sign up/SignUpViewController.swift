//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton?
    @IBOutlet weak var signInLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonProperty(button: signUpBtn!)
        clickLabel(label: signInLabel!)
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    
    // tap to sign in label
    func clickLabel(label : UILabel){
        label.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signInLabelClicked(_:)))
        label.addGestureRecognizer(guestureRecognizer)
    }
    
    @objc func signInLabelClicked(_ sender: Any){
        if let viewControllers = navigationController?.viewControllers{
            // check signIn view has been in navigation controller yet
            let storyboard = UIStoryboard(name: "SignInViewController", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController? else { return }
            
            if viewControllers.contains(vc){
                navigationController?.popViewController(animated: true)
            }
            else{
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
