//
//  ExamHistoryViewController2.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class ExamHistoryViewController2: UIViewController {
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

        // Do any additional setup after loading the view.
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
