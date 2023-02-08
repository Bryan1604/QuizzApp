//
//  ForgotPassword1ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class ForgotPassword1ViewController: UIViewController {

    @IBOutlet weak var SendBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonProperty(button: SendBtn!)
        
        // Do any additional setup after loading the view.
    }
    
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
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
