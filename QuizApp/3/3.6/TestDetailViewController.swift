//
//  TestDetailViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/22/23.
//

import UIKit

class TestDetailViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var backScreenBtn: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var questionName: UILabel!
    @IBOutlet weak var questionDetail: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionMenu: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var previousQuestion: UIButton!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var listOfQuestionViewPopup: UIView!
    @IBOutlet weak var listOfQuestion: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.layer.cornerRadius = 20
        layoutButton(button: option1)
        layoutButton(button: option2)
        layoutButton(button: option3)
        layoutButton(button: option4)
        
        // set the size og the blur view to equal to size ò overall view
        submitBtn.layer.cornerRadius = 20
        popupView.layer.cornerRadius = 20
  
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.8, height: 218)
        //view.addSubview(collectionQuestionView)
        
        // set up popup of list question
//        self.listOfQuestion.delegate = self
//        self.listOfQuestion.dataSource = self
//        self.listOfQuestion?.register(UINib(nibName: "QuestionCollectionCell",bundle: nil),
//                                      forCellWithReuseIdentifier: "QuestionCollectionCell")
//        listOfQuestionViewPopup.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.8, height: 218)
        
    }
    
    func layoutButton(button: UIButton){
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    @IBAction func back(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func answerPressedUp(_ sender: UIButton!){
        self.option1.layer.backgroundColor = .init(red: 99, green: 156, blue: 253, alpha: 0.2)
        //sender.backgroundColor = .init(red: 99, green: 156, blue: 253, alpha: 0.2)
        print("1")
    }
    
    @IBAction func presentPopUpOfQuestion(_ sender: Any){
        //        let popupVC = PopUpViewController()
        //        print("hi1")
        //        popupVC.modalPresentationStyle = .pageSheet
        //        self.present(popupVC, animated: true, completion: nil)
        //        print("hi 2")
        let storyBoard = UIStoryboard(name: "PopUpViewController", bundle: nil)
        let popoverController = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController")
        //    presentPopover(self, popoverController, sender: popoverButton, size: CGSize(width: 327, height: 125))
        popoverController.preferredContentSize = CGSize(width: 123, height: 125)
        popoverController.modalPresentationStyle = .popover
        // present popover
        if let popoverPresentationController = popoverController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = questionMenu?.frame ?? CGRect.zero
            popoverPresentationController.delegate = self
            present(popoverController,animated: true, completion: nil)
        }
    }
//    func presentPopover(_ parentViewController: UIViewController, _ viewController: UIViewController, sender: UIView, size: CGSize, arrowDirection: UIPopoverArrowDirection = .down) {
//            viewController.preferredContentSize = size
//            viewController.modalPresentationStyle = .popover
//            self.present(viewController, animated: true)
//            if let pop = viewController.popoverPresentationController {
//                pop.sourceView = sender
//                pop.sourceRect = sender.bounds
//                pop.permittedArrowDirections = arrowDirection
//            }
//        }

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
    
    @IBAction func submitAction(_ sender : Any){
        let storyboard = UI
    }
}

//extension TestDetailViewController: UIPopoverPresentationControllerDelegate {
//
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }
//
//    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//
//    }
//
//    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
//        return true
//    }
//}

//extension TestDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionCell", for: indexPath) as! QuestionCollectionCell
//        cell.numberOfQuestion?.text = "\(indexPath.row)"
//        cell.backgroundColor = .black
//        // chage color and status when question be answered
//        //....
//        return cell
//    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//
//}
