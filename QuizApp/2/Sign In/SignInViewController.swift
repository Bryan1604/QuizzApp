//
//  SignInViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 06/02/2023.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton?
    @IBOutlet weak var signInGoogleBtn: UIButton?
    @IBOutlet weak var signInFacebookBtn: UIButton?
    @IBOutlet weak var signInAppleBtn: UIButton?
    @IBOutlet weak var signUpLabel: UILabel?
    @IBOutlet weak var forgotPassword: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()

        setAllButton()
        clickLabel(label: signUpLabel!)
        clickLabel(label: forgotPassword!)
    }
    func setAllButton(){
        setButtonProperty(button: signInFacebookBtn!,
                          text: "Đăng nhập bằng Facebook",
                          image: "Facebook")
        setButtonProperty(button: signInGoogleBtn!,
                          text: "Đăng nhập bằng Google",
                          image: "Google")
        setButtonProperty(button: signInAppleBtn!,
                          text: "Đăng nhập bằng Apple ID",
                          image: "Apple")
        setButtonProperty(button: signInBtn! ,
                          text: "Đăng nhập",
                          image: "")
    }
    func setButtonProperty( button: UIButton, text: String, image: String ){
        button.setTitle(text, for: .normal)
        button.setImage(UIImage(named: image), for: .normal)
        button.layer.cornerRadius = 20
        
        if(text == "Đăng nhập"){
            button.backgroundColor = UIColor(rgb: 0x639CFD)
            button.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        }else{
            button.backgroundColor = UIColor(rgb: 0xFFFFFF)
            button.setTitleColor(UIColor(rgb: 0x0C092A), for: .normal)
            button.layer.borderColor = UIColor.systemBlue.cgColor
            button.layer.borderWidth = 1
        }
    }
    
    func clickLabel(label : UILabel){
        label.isUserInteractionEnabled = true
        if(label.text == "Đăng kí ngay") {
           let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpLabelClicked(_:)))
            label.addGestureRecognizer(guestureRecognizer)
        }
        else{
            let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordLabelClicked(_:)))
            label.addGestureRecognizer(guestureRecognizer)
        }
        
    }
    @objc func signUpLabelClicked(_ sender: Any){
        let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func forgotPasswordLabelClicked(_ sender: Any){
        let storyboard = UIStoryboard(name: "ForgotPassword1Storyboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ForgotPassword1ViewController") as! ForgotPassword1ViewController
        navigationController?.pushViewController(vc, animated: true)
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


extension UIColor {
    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
