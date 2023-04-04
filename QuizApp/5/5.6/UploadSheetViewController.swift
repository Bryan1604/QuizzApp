//
//  UploadSheetViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit

class UploadSheetViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var backBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView()
        self.navigationController?.isNavigationBarHidden = true
    }
    

    func layoutView(){
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        view1.layer.cornerRadius = 20
        checkBtn.layer.cornerRadius = 20
        backBtn2.layer.cornerRadius = 20
        
        
        popupView.layer.cornerRadius = 20
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.8, height: 218)
    }
    
    @IBAction func checkAction(_ sender: Any) {
        animateIn(designedView: blurView)
        animateIn(designedView: popupView)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backAction2(_ sender: Any) { // back from popup view
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
