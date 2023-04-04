//
//  ChangePasswordViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var resetBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 20
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        view2.layer.cornerRadius = 20
        view2.layer.borderWidth = 2
        view2.layer.borderColor = UIColor.systemGray5.cgColor
        resetBtn.layer.cornerRadius = 20
    }
   
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
