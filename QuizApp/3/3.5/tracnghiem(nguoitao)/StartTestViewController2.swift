//
//  StartTestViewController_2.swift
//  QuizApp
//
//  Created by Luong Vu on 3/29/23.
//

import UIKit

class StartTestViewController2: UIViewController {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewChild1: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var viewChild2: UIView!
    @IBOutlet weak var rememberTest: UIButton!

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewChild1.layer.cornerRadius = 20
        startBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
        rememberTest.layer.cornerRadius = 20
        rememberTest.layer.borderWidth = 1.5
        rememberTest.layer.borderColor = .init(red: 99, green: 156, blue: 253, alpha: 0.2)
        
        submitBtn.layer.cornerRadius = 20
        popupView.layer.cornerRadius = 20
  
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: 325, height: 218)
    }
    
    @IBAction func goBack(){
        navigationController?.popViewController(animated: true)
    }

    @IBAction func start(){
        let vc = UIStoryboard(name: "TestDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "TestDetailViewController") as! TestDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func submitAction(_ sender: Any) {
        animateIn(designedView: blurView)
        animateIn(designedView: popupView)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }
    
    func animateIn(designedView: UIView){
        let backgroundView = self.view
        backgroundView?.addSubview(designedView)
        designedView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        designedView.alpha = 0
        designedView.center = backgroundView!.center
        UIView.animate(withDuration: 0.3,  animations: {
            designedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            designedView.alpha = 2
        })
    }
    
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    // MARK: - Navigation
    
}
