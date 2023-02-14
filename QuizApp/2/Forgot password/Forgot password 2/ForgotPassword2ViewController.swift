//
//  ForgotPassword2ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class ForgotPassword2ViewController: UIViewController {

    @IBOutlet weak var reSetPasswordBtn: UIButton?
    @IBOutlet weak var newPassword1: UITextField?
    @IBOutlet weak var newPassword2: UITextField?
    
    var iconClick = false
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonProperty(button: reSetPasswordBtn!)
        hiddenPassword()
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    
    func hiddenPassword(){
        newPassword1?.isSecureTextEntry = true
        newPassword2?.isSecureTextEntry = true
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
