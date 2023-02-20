//
//  ForgotPassword1ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class ForgotPassword1ViewController: UIViewController {

    @IBOutlet weak var SendBtn: UIButton?
    @IBOutlet weak var insertText: UITextField?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonProperty(button: SendBtn!)
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    
    @IBAction func didTapSendBtn(){
        if insertText?.text?.isEmpty == true{
            navigationController?.popViewController(animated: true)
        }
        else{
            let storyboard = UIStoryboard(name: "ForgotPassword2Storyboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassword2ViewController") as! ForgotPassword2ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
 
}
