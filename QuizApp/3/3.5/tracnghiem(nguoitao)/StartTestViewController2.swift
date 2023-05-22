//
//  StartTestViewController_2.swift
//  QuizApp
//
//  Created by Luong Vu on 3/29/23.
//

import UIKit
import SDWebImage
class StartTestViewController2: UIViewController {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detail: UILabel!
    //@IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewChild1: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var viewChild2: UIView!
    @IBOutlet weak var rememberTest: UIButton!
    @IBOutlet weak var finishSubmitBtn: UIButton!

    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewChild1.layer.cornerRadius = 20
        startBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
        rememberTest.layer.cornerRadius = 20
        rememberTest.layer.borderWidth = 1.5
        rememberTest.layer.borderColor = UIColor(red: 99/255, green: 156/255, blue: 253/255, alpha: 0.2).cgColor
        
        popupView.layer.cornerRadius = 20
        finishSubmitBtn.layer.cornerRadius = 20
  
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: 325, height: 218)
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    @IBAction func saveExam(_ sender: Any) {
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let exam_id = UserDefaults.standard.integer(forKey: "ExamId")
        let request = PostSaveExamRequest.Post(user_id: user_id, exam_id: exam_id ).route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let postSaveExamResponse = try? decoder.decode(PostSaveExamResponse.self, from: data) {
                let examJson = postSaveExamResponse.statusCode
            }
        }
        self.animateIn(designedView: self.blurView)
        self.animateIn(designedView: self.popupView)
    }
    
    @IBAction func finishSaveExam(_ sender: Any){
        self.navigationController?.popToRootViewController(animated: true)
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
    
    func presentView(_ exam: Exam){
        subTitle.text = UserDefaults.standard.string(forKey: "SubjectTitle")
        mainTitle.text = exam.title
        numberOfQuestion.text =  "\( exam.number ?? 0 ) Câu hỏi"
        time.text = "\(exam.time ?? 0) Phút"
        detail.text = exam.description
        avatar.sd_setImage(with: URL(string: exam.image ?? ""))
        name.text = exam.author_name
    }
    
 
}
