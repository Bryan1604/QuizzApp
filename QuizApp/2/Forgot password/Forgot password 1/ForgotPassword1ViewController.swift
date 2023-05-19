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
            self.navigationController?.popViewController(animated: true)
        }
        else{
            let request = ForgotPasswordRequest.Post(email: (insertText?.text)!).route
            APIManager.session.request(request).responseJSON{ json in
                print(json)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                if let data = json.data, let forgotPasswordResponse = try? decoder.decode(ForgotPasswordResponse.self, from: data) {
                    let statusCode = forgotPasswordResponse.statusCode
                    if statusCode == 200{
                        let storyboard = UIStoryboard(name: "ForgotPassword2Storyboard", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassword2ViewController") as! ForgotPassword2ViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
}
