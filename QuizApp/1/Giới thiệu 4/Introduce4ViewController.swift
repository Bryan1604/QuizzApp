//
//  Introduce4ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 03/02/2023.
//

import UIKit

class Introduce4ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var registerBox : UIView!
    @IBOutlet weak var signUpButton : UIButton!
    @IBOutlet weak var signInButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()

        setbutton(button: signInButton, text: "Đăng nhập", radius: 20)
        setbutton(button: signUpButton, text: "Đăng kí", radius: 20)
        // Do any additional setup after loading the view.
    }
    
    func setBackground(){
        registerBox?.layer.cornerRadius = 20
        registerBox.backgroundColor = .white.withAlphaComponent(0.2)
    }
    func setbutton(button: UIButton ,text: String, radius: Int){
        button.layer.cornerRadius = CGFloat(radius)
        button.setTitle(text, for: .normal)
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
