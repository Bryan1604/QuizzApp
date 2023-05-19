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
    
    var user_id: Int!
    var exam_history_id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewChild1.layer.cornerRadius = 20
        reviewBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
        getExamHistoryDetail()
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
    
    func getExamHistoryDetail(){
        let request = GetExamHistoryDetailRequest.Get(user_id: self.user_id, exam_history_id: self.exam_history_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getExamHistoryDetailResponse = try? decoder.decode(GetExamHistoryDetailResponse.self, from: data) {
                let exam = getExamHistoryDetailResponse.result
                self.subTitle.text = exam?.subject_title
                self.mainTitle.text = exam?.exam_title
                self.numberOfQuestion.text = "\(exam?.number ?? 0) câu hỏi"
                self.time.text = "\(exam?.time ?? 0) phút"
                self.detail.text = exam?.description
            }
        }
    }
    
    @IBAction func viewExam(){
        let vc = UIStoryboard(name: "ResultViewController", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.user_id = user_id
        vc.exam_history_id = exam_history_id
        vc.question_id = 1
        navigationController?.pushViewController(vc, animated: true)
    }

}
