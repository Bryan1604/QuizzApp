//
//  SavedViewController2.swift
//  QuizApp
//
//  Created by Luong Vu on 4/2/23.
//

import UIKit

class SavedViewController2: UIViewController{
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var user_id: Int!
    var subject_id: Int?
    var type : Int?
    var sort_field : Int?
    var sort_by : String?
    
    var subject_title: String?
    var examList : [SavedExamResponse.Result.Exam]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        titleLabel.text = subject_title
        registerNib()
        getSavedExam()
    }
        
    func registerNib(){
        tableView.register(UINib(nibName: "testCell", bundle: nil), forCellReuseIdentifier: "testCell")
    }
        
    @IBAction func goBack(){
            navigationController?.popViewController(animated: true)
        }
        
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { action in
            switch action.title{
            case "Theo thời gian":
                self.sort_field = 1
                self.getSavedExam()
            case "Số lượng tạo":
                self.sort_field = 2
                self.getSavedExam()
            default:
                self.sort_field = 3
                self.getSavedExam()
            }
        }
        let menu = UIMenu(children : [
            UIAction(title: "Theo thời gian", state: .off, handler: optionClosure),
            UIAction(title: "Số lượng tạo", state: .off, handler: optionClosure),
            UIAction(title: "Môn học", state: .off, handler: optionClosure)
        ])
        filterBtn.menu = menu
        filterBtn.showsMenuAsPrimaryAction = true
        filterBtn.changesSelectionAsPrimaryAction = false
        
    }
}

extension SavedViewController2: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return examList?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! testCell
            
            cell.title.text = examList?[indexPath.row].title
            cell.thumnail.image = UIImage(named: examList?[indexPath.row].image ?? "")
            cell.parentTitle.text = "Số lượt tạo: " + "\(examList?[indexPath.row].saved_number ?? 0)"
            cell.quantity.text = "| Người tạo: "  + (examList?[indexPath.row].author_name ?? "")
            cell.id = examList?[indexPath.row].id
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = UIStoryboard(name: "StartTestViewController", bundle: nil).instantiateViewController(withIdentifier: "StartTestViewController") as! StartTestViewController
            navigationController?.pushViewController(vc, animated: true)
        }
}

extension SavedViewController2{
    func getSavedExam(){
        let request = SavedExamRequest.Post(user_id: user_id!, subject_id: subject_id!, type: 0, sort_field: sort_field, sort_by: sort_by).route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let savedExamResponse = try? decoder.decode(SavedExamResponse.self, from: data) {
                self.examList = savedExamResponse.result.exam_list
                self.tableView.reloadData()
            }
        }
    }
}
