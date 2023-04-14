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
//        if insertText?.text?.isEmpty == true{
//            navigationController?.popViewController(animated: true)
//        }
//        else{
            let request = ForgotPasswordRequest.Post(email: insertText?.text ?? "").route
        APIManager.session.request(request).responseJSON{ json in
            print("\(json)")
        }
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .useDefaultKeys
//                if let data = json.data, let loginResponse = try? decoder.decode(LoginResponse.self, from: data) {
//                    let token = loginResponse.result.access_token
//                    UserDefaults.standard.set(token, forKey: "token")
//                    UserDefaults.standard.synchronize()
//                }
        
        if insertText?.text?.isEmpty == false{
            let storyboard = UIStoryboard(name: "ForgotPassword2Storyboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassword2ViewController") as! ForgotPassword2ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
 
}
