//
//  SetUpViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit

class SetUpViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var logOutLabel: UILabel!
    
    var tapGesture1 = UITapGestureRecognizer()
    var tapGesture2 = UITapGestureRecognizer()
    var tapGesture3 = UITapGestureRecognizer()
    var tapGesture4 = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        layoutSubView()
        self.navigationController?.isNavigationBarHidden = true
        didTapView()
    }
    
    func layoutSubView(){
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
        view3.layer.cornerRadius = 20
        view4.layer.cornerRadius = 20
        view5.layer.cornerRadius = 20
        view6.layer.cornerRadius = 20
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didTapView(){
        
        tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
            tapGesture1.numberOfTapsRequired = 1
            tapGesture1.numberOfTouchesRequired = 1
            view1.addGestureRecognizer(tapGesture1)
            view1.isUserInteractionEnabled = true
        
        tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        view3.addGestureRecognizer(tapGesture3)
        view3.isUserInteractionEnabled = true
        
        tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2(_:)))
            tapGesture2.numberOfTapsRequired = 1
            tapGesture2.numberOfTouchesRequired = 1
            view2.addGestureRecognizer(tapGesture2)
            view2.isUserInteractionEnabled = true
        
        tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(tapLogOut(_:)))
        logOutLabel.isUserInteractionEnabled = true
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        logOutLabel.addGestureRecognizer(tapGesture4)
        
    }
    
    @objc func handleTap1(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "UpdateInfoViewController", bundle: nil).instantiateViewController(withIdentifier: "UpdateInfoViewController") as! UpdateInfoViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleTap3(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "ChangePasswordViewController", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleTap2(_ sender: UITapGestureRecognizer){
        let vc = (UIStoryboard(name: "UpdateEmailViewController", bundle: nil).instantiateViewController(withIdentifier: "UpdateEmailViewController") as! UpdateEmailViewController)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapLogOut(_ sender: UITapGestureRecognizer){
        UserDefaults.standard.removeObject(forKey: "AccessToken")
        let storyboard = UIStoryboard(name: "Introduce4ViewController", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "Introduce4ViewController") as! Introduce4ViewController
        let rootView = UINavigationController(rootViewController: login)
        SceneDelegate.shared?.changeRootController(rootView)
    }

}
