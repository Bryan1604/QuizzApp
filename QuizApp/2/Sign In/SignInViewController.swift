//
//  SignInViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 06/02/2023.
//

import UIKit
import FacebookLogin
import GoogleSignIn
class SignInViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton?
    @IBOutlet weak var signInGoogleBtn: UIButton?
    @IBOutlet weak var signInFacebookBtn: UIButton?
    @IBOutlet weak var signInAppleBtn: UIButton?
    @IBOutlet weak var signUpLabel: UILabel?
    @IBOutlet weak var forgotPassword: UILabel?
    
    @IBOutlet weak var phoneNumber: UITextField?
    @IBOutlet weak var password: UITextField?
    @IBOutlet weak var hidden: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        password?.isSecureTextEntry = true
        
        setAllButton()
        
        clickLabel(label: signUpLabel!)
        clickLabel(label: forgotPassword!)
        
        //set the presentingViewController property of the GIDSignIn.shareInstance onject
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    func setAllButton(){
        setButtonProperty(button: signInFacebookBtn!)
        setButtonProperty(button: signInGoogleBtn!)
        setButtonProperty(button: signInAppleBtn!)
        setButtonProperty(button: signInBtn!)
    }
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 1
        
    }
}


extension SignInViewController{
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
}

extension SignInViewController{
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
}

extension SignInViewController{
    // login with facebook
    @IBAction func signInFacebookBtnClicked(){
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: self){result, error in
            if let error = error{
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                // save token in userdefault
                let token = result?.token?.tokenString
                let userId = result?.token?.userID
                UserDefaults.standard.set(token, forKey: "AccessToken")
                UserDefaults.standard.set(userId, forKey: "UserId")

                print("Logged In")
                Profile.loadCurrentProfile { profile, error in
                    if let firstName = profile?.firstName {
                        print("Hello, \(firstName)")
                        print("AccessToken: " + (UserDefaults.standard.string(forKey: "AccessToken") ?? "") )
                        print("User_Id: " + (UserDefaults.standard.string(forKey: "UserId") ?? "") )

                    }
                }
            }
        }
    }
    
    // login with google
    @IBAction func signInGoogleBtnClicked(sender: Any){
        GIDSignIn.sharedInstance().signIn()
        guard let user = GIDSignIn.sharedInstance().currentUser  else {return}
            // get infor's user
            let emailAddress = user.profile.email
    //        let givenName = user.profile.givenName
    //        let familyName = user.profile.familyName
    //        let profilePictureUrl = user.profile.imageURL(withDimension: 320)
            print(emailAddress ?? "")
    }
    
    // hide password
    @IBAction func hiddenPassword(){
        hiddenAction()
    }
    
    func hiddenAction(){
        if password?.isSecureTextEntry == true{
            password?.isSecureTextEntry = false
            hidden?.setImage(UIImage(named:"eye"), for: .normal)
        }else{
            password?.isSecureTextEntry = true
            hidden?.setImage(UIImage(named:"eye-slash"), for: .normal)
        }
    }
    
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
