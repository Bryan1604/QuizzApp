//
//  TestListViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/21/23.
//

import UIKit
import SDWebImage
class TestListViewController: UIViewController{
    
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
        
    let user_id = UserDefaults.standard.integer(forKey: "UserId")
    let subject_id = UserDefaults.standard.integer(forKey: "SubjectId")
    var type: Int?
    var sort_field: Int?
    var sort_by: String?
    
    
    var listExam = [Exam]()
    var subject : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchView.layer.cornerRadius = 20
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        registerNib()
        getListExam()
        
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "testCell", bundle: nil), forCellReuseIdentifier: "testCell")
    }
    
    @IBAction func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { action in
            self.reloadData()
            if action.title == "Theo thời gian"{
                self.sort_field = 1
            }
            else if action.title == "Theo thời gian"{
                self.sort_field = 2
            }
            else {
                self.sort_field = 3
            }
            self.getListExam()
        }
        let menu = UIMenu(children : [
            UIAction(title: "Theo thời gian", state: .off, handler: optionClosure),
            UIAction(title: "Só lượng tạo", state: .off, handler: optionClosure),
            UIAction(title: "Môn học", state: .off, handler: optionClosure)
        ])
        filterBtn.menu = menu
        filterBtn.showsMenuAsPrimaryAction = true
        filterBtn.changesSelectionAsPrimaryAction = false
    }
}

extension TestListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listExam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! testCell
        cell.title.text = listExam[indexPath.row].title
        cell.thumnail.sd_setImage(with: URL(string: listExam[indexPath.row].image ?? ""))
        cell.parentTitle.text = subject
        cell.quantity.text = "・" + " \(listExam[indexPath.row].number ?? 0) Trăc nghiệm"
        cell.id = listExam[indexPath.row].id
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (self.subject ?? "") + " | Khoa học"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! testCell
        let exam_id = cell.id
        let subject_title = self.subject
        UserDefaults.standard.set(exam_id, forKey: "ExamId")
        UserDefaults.standard.set(subject_title, forKey: "SubjectTitle")
        if UserDefaults.standard.integer(forKey: "Type") == 0{
            let vc = UIStoryboard(name: "StartTestViewController", bundle: nil).instantiateViewController(withIdentifier: "StartTestViewController") as! StartTestViewController
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = UIStoryboard(name: "StartTestViewController2", bundle: nil).instantiateViewController(withIdentifier: "StartTestViewController2") as! StartTestViewController2
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

extension TestListViewController{
    func getListExam(){
        let type = UserDefaults.standard.integer(forKey: "Type")
        let request = ListExamRequest.Post(user_id: self.user_id, subject_id: self.subject_id, type: type, sort_field: self.sort_field,sort_by: "asc").route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let listExamResponse = try? decoder.decode(ListExamResponse.self, from: data) {
                var exams = listExamResponse.result.list_exam
                self.subject = listExamResponse.result.title
                if exams!.count > 0{
                    for i in stride(from: 0, to: exams!.count, by: 1){
                        let exam = Exam(author_email: exams?[i].author_email, author_id: exams?[i].id,author_name: exams?[i].author_name, id: exams?[i].id, image: exams?[i].image, number: exams?[i].number, save_num: exams?[i].saved_num, status: exams?[i].status, time: exams?[i].time, title: exams?[i].title)
                        self.listExam.append(exam)
                    }
                }
                print(self.listExam)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func reloadData(){
        self.listExam.removeAll()
    }
}
