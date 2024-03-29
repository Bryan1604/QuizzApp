//
//  StartViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit

let defaults = UserDefaults.standard

class StartViewController: UIViewController {

    //let defaults = UserDefaults.standard
    @IBOutlet weak var image: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setBackground()
    }
    
    func setBackground(){
        image?.image = UIImage(named: "Logo")
        let showTutorial = defaults.bool(forKey: "showTutorial")
        let token = defaults.string(forKey: "AccessToken") ?? ""
        let statusCode = defaults.integer(forKey: "StatusCode")
        
        if showTutorial == true {
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let tutorial = storyboard.instantiateViewController(withIdentifier: "TutorialViewController") as! TutorialViewController
            let rootView = UINavigationController(rootViewController: tutorial)
            SceneDelegate.shared?.changeRootController(rootView)
            defaults.set(false, forKey: "showTutorial")
        }else {
            if !token.isEmpty && statusCode == 200  {
                let storyboard = UIStoryboard(name: "TabBarViewController", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                let rootView = UINavigationController(rootViewController: vc)
                SceneDelegate.shared?.changeRootController(rootView)
            }
            else{
                let storyboard = UIStoryboard(name: "Introduce4ViewController", bundle: nil)
                let login = storyboard.instantiateViewController(withIdentifier: "Introduce4ViewController") as! Introduce4ViewController
                let rootView = UINavigationController(rootViewController: login)
                SceneDelegate.shared?.changeRootController(rootView)
            }
        }
    }
}


