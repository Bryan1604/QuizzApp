//
//  ExamHistoryViewController2.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class ExamHistoryViewController2: UIViewController {
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
        layoutBtn(button: option1)
        layoutBtn(button: option2)
        layoutBtn(button: option3)
        layoutBtn(button: option4)
        
        // Do any additional setup after loading the view.
    }
    
    func layoutBtn(button: UIButton){
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1.5
    }

    @IBAction func backAction(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
}
