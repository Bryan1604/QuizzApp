//
//  TestDetailViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/22/23.
//

import UIKit
import Popover
import KUIPopOver
import SDWebImage
class ResultViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var questionMenu: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var previousQuestion: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
            
    var listQuestion: [ExamListQuestionResponse.Result.ExamQuestion]?
    
    var question_id: Int!
    
    var listQuestionResult: [String: Int?] = [:]  // ket qua dung
    var answer_list: [String: Int?] = [:]  // key qua cua nguoi dung

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
                
        registerNib()
        getExamResult()
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "AnswerViewCell", bundle: nil), forCellReuseIdentifier: "AnswerViewCell")
        tableView.register(UINib(nibName: "HeaderQuestionViewCell", bundle: nil), forCellReuseIdentifier: "HeaderQuestionViewCell")
        tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "ImageViewCell")
    }
    
    func getExamResult() {
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let exam_history_id = UserDefaults.standard.integer(forKey: "ExamId")
        
        let request = GetExamResultRequest.Post(user_id: user_id, exam_history_id: exam_history_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getExamResultResponse = try? decoder.decode(GetExamResultResponse.self, from: data) {
                self.listQuestionResult = getExamResultResponse.result!.exam_result
            }
        }
    }
    
    func getListExam(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let exam_id = UserDefaults.standard.integer(forKey: "ExamId")
        
        let request = ExamListQuestionRequest.Post(user_id: user_id, exam_id: exam_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let examListQuestionResponse = try? decoder.decode(ExamListQuestionResponse.self, from: data) {
                self.listQuestion = examListQuestionResponse.result?.exam_question_list
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func goNextQuestion(_ sender: UIButton){
        if question_id < listQuestion!.count{
            question_id = question_id + 1
            tableView.reloadData()
        }
    }
    @IBAction func backToPreviousQuestion(_ sender: UIButton){
        if question_id > 1{
            question_id = question_id - 1
            tableView.reloadData()
        }
    }
    
    @IBAction func presentPopUpOfQuestion(_ sender: UIButton){
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 8
        collectionViewFlowLayout.minimumInteritemSpacing = 8
        collectionViewFlowLayout.sectionInset.bottom = 8
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 36, height: 135), collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCollectionCell",bundle: nil),forCellWithReuseIdentifier: "QuestionCollectionCell")
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.itemSize = CGSize(width: 64, height: 64)
        let options = [
            .type(.up),
            .cornerRadius(20)
        ] as [PopoverOption]
        let popover = Popover(options: options, showHandler: nil, dismissHandler: nil)
        popover.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 0.85).cgColor
        popover.layer.borderWidth = 2
        popover.layer.cornerRadius = 20
        popover.blackOverlayColor = UIColor.clear
        popover.show(collectionView, fromView: sender)
    }

}

extension ResultViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listQuestion!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionCell", for: indexPath) as! QuestionCollectionCell
        cell.numberOfQuestion?.text = "\(indexPath.row + 1)"
        if question_id == indexPath.row + 1{
            cell.questionCell?.layer.backgroundColor = UIColor.init(red: 99/255, green: 156/255, blue: 253/255, alpha: 1).cgColor // mau cua cell da duoc chon va dang hien thi cau hoi cua cell nay
            cell.numberOfQuestion?.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }else if listQuestion?[indexPath.row].is_selected == true {
            cell.select = true
        } else{
            cell.select = false
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        question_id = indexPath.row + 1
        tableView.reloadData()
        collectionView.reloadData()
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            if listQuestion?[question_id-1].question_image == "" {
                return 0
            }else{
                return 1
            }
        default:
                return listQuestion?[question_id-1].answer_list!.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderQuestionViewCell") as! HeaderQuestionViewCell
            cell.numberOfQuetion.text = "Câu \(question_id ?? 1) trên \(listQuestion?.count ?? 0)"
            cell.title.text = listQuestion?[question_id-1].question_title
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as! ImageViewCell
            cell.imageCell.sd_setImage(with: URL(string: (listQuestion?[question_id-1].question_image ?? "")))
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerViewCell") as! AnswerViewCell
            cell.id = listQuestion?[question_id-1].answer_list![indexPath.row].answer_id
            if listQuestion?[question_id-1].answer_id == cell.id && listQuestion?[question_id-1].is_selected == true{
                cell.select = true
            }else{
                cell.select = false
            }

            cell.content.text = listQuestion?[question_id-1].answer_list?[indexPath.row].content
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listQuestion?[question_id-1].answer_id = .none
        tableView.reloadData()
        
        let selectCell = tableView.cellForRow(at: indexPath) as! AnswerViewCell
        selectCell.select = true
        listQuestion?[question_id-1].is_selected = true
        listQuestion?[question_id-1].answer_id = selectCell.id
        answer_list["\(question_id!)"] = listQuestion?[question_id-1].answer_id
    }

}
