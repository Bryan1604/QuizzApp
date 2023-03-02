//
//  TapBarViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 28/02/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    var homeBtn: UIButton?
    var uploadBtn: UIButton?
    var historyBtn: UIButton?
    var profileBtn: UIButton?
    
    var arrayView: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        callItemViewController()
        // Do any additional setup after loading the view.
    }
    
    func callItemViewController(){
        let storyboard1 = UIStoryboard(name: "HomeViewController", bundle: nil)
        let vc1 = storyboard1.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let storyboard2 = UIStoryboard(name: "UploadViewController", bundle: nil)
        let vc2 = storyboard2.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
        
        let storyboard3 = UIStoryboard(name: "HistoryViewController", bundle: nil)
        let vc3 = storyboard3.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        
        let storyboard4 = UIStoryboard(name: "ProfileViewController", bundle: nil)
        let vc4 = storyboard4.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        arrayView.append(vc1)
        arrayView.append(vc2)
        arrayView.append(vc3)
        arrayView.append(vc4)
        
        self.setViewControllers(arrayView, animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.barTintColor = .gray
        
        guard let items = self.tabBar.items else{
            return
        }
        
        let images = ["Home","Discover","Leaderboard","Profile"]
        for i in 0..<items.count{
            items[i].image = UIImage(named: images[i])
        }
        
        self.modalPresentationStyle = .fullScreen
        
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
