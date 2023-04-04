//
//  ExamHistoryViewController1.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class ExamHistoryViewController1: UIViewController {

    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewChild1: UIView!
    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var viewChild2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewChild1.layer.cornerRadius = 20
        reviewBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender : AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func reviewAction(_ sender : AnyObject){
        let vc = UIStoryboard(name: "ExamHistoryViewController2", bundle: nil).instantiateViewController(withIdentifier: "ExamHistoryViewController2") as! ExamHistoryViewController2
        self.navigationController?.pushViewController(vc, animated: true)
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
