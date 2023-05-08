//
//  StartTestViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/22/23.
//

import UIKit

class StartTestViewController: UIViewController {

    @IBOutlet weak var parentTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewChild1: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var viewChild2: UIView!
    
//    var exam = Exam()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewChild1.layer.cornerRadius = 20
        startBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
        
        getDetailExam()
    }
    
    @IBAction func goBack(){
        navigationController?.popViewController(animated: true)
    }

    @IBAction func start(){
        let vc = UIStoryboard(name: "TestDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "TestDetailViewController") as! TestDetailViewController
        vc.question_id = 1
        navigationController?.pushViewController(vc, animated: true)
    }
  
    func presentView(_ exam: Exam){
        parentTitle.text = UserDefaults.standard.string(forKey: "SubjectTitle")
        mainTitle.text = exam.title
        numberOfQuestion.text =  "\( exam.number ?? 0 ) Câu hỏi"
        time.text = "\(exam.time ?? 0) Phút"
        detail.text = exam.description
    }
    
    func getDetailExam(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let exam_id = UserDefaults.standard.integer(forKey: "ExamId")
        let request = ExamDetailRequest.Post(user_id: user_id, exam_id: exam_id ).route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let examDetailResponse = try? decoder.decode(ExamDetailResponse.self, from: data) {
                let examJson = examDetailResponse.result
                if (examJson?.id)! > 0{
                    let exam = Exam(author_email: examJson?.author_email, author_id: examJson?.id,author_name: examJson?.author_name, id: examJson?.id, image: examJson?.image, number: examJson?.number, status: examJson?.status, time: examJson?.time, title: examJson?.title)
                    self.presentView(exam)
                    }
                }
                DispatchQueue.main.async {
                    self.reloadInputViews()
                }
            }
        }
}
