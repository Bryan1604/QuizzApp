//
//  SharePopUpViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit
import VerticalSlidingPresentationController
class SharePopUpViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView(view1)
        layoutView(view2)
        layoutView(view3)
    }
    
    func layoutView(_ view: UIView){
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1.5
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
