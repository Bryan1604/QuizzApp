//
//  UploadViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//


import UIKit
import VerticalSlidingPresentationController
import KUIPopOver
class UploadViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var sheetUploadBtn: UIButton!
    @IBOutlet weak var excelUploadBtn: UIButton!
    @IBOutlet weak var handMadeUploadBtn: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!

    @IBOutlet weak var createbtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView(view: view1)
        layoutView(view: view2)
        layoutView(view: view3)
        layoutView(view: view4)
        layoutView(view: view5)
        layoutView(view: view6)
        
        layoutButton(sheetUploadBtn)
        layoutButton(excelUploadBtn)
        layoutButton(shareBtn)

        handMadeUploadBtn.layer.cornerRadius = 20
        createbtn.layer.cornerRadius = 20
    }
   
    func layoutView(view: UIView){
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray5.cgColor
       // UIColor.init(red: 99, green: 156, blue: 253, alpha: 0).cgColor
    }
    

    func layoutButton(_ button: UIButton){
        button.layer.cornerRadius=20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    
    @IBAction func upLoadFromSheet(_ sender: Any) {
        let vc = UIStoryboard(name: "UploadSheetViewController", bundle: nil).instantiateViewController(withIdentifier: "UploadSheetViewController") as! UploadSheetViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func shareAction(){
        let myViewController = UIStoryboard(name: "SharePopUpViewController", bundle: nil).instantiateViewController(withIdentifier: "SharePopUpViewController")

//        
//        myViewController.modalPresentationStyle = .popover
//        //var Popover = vc.popoverPresentationController
//        if let Popover = myViewController.popoverPresentationController {
//            Popover.sourceView = self.view
//            Popover.sourceRect = CGRectMake(self.view.center.x,self.view.center.y+180,0,0)
//            myViewController.preferredContentSize = CGSizeMake(300,360)
//            Popover.delegate = self
//        }
        
        if let presentationController = myViewController.presentationController as? UISheetPresentationController {
                    presentationController.detents = [.medium()] /// change to [.medium(), .large()] for a half *and* full screen sheet
//            presentationController.sourceView?.layer.cornerRadius = 50
//            presentationController.sourceView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
                }
        self.present(myViewController, animated: true)

    }
}
