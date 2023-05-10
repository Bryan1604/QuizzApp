//
//  ExamHistoryViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/23/23.
//

import UIKit
import SDWebImage
import Alamofire
class ExamHistoryViewController: UIViewController{

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    var sort_field : Int?
    var sort_by: String?
    
    var listExam = [GetExamHistoryListResponse.Result]()
    var systemListExam = [GetExamHistoryListResponse.Result]()
    var userListExam = [GetExamHistoryListResponse.Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        searchView.layer.cornerRadius = 20
        searchView.layer.borderWidth = 2
        //searchView.layer.borderColor = UIColor(red: 239, green: 238, blue: 252, alpha: 1).cgColor
        searchView.layer.borderColor = UIColor.systemGray5.cgColor
        registerCell()
        getExamHistoryList()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //getExamHistoryList()
        //sortListExam()
    }
    
    func registerCell(){
        tableView.register(UINib(nibName: "ExamViewCell", bundle: nil), forCellReuseIdentifier: "ExamViewCell")
    }
    
    func getExamHistoryList(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        
        let request = GetExamHistoryListRequest.Post(user_id: user_id, sort_field: sort_field, sort_by: sort_by, limit: 10, offset: 0).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getExamHistoryListResponse = try? decoder.decode(GetExamHistoryListResponse.self, from: data) {
                self.listExam = getExamHistoryListResponse.result!
                self.sortListExam()

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func sortListExam(){
        userListExam.removeAll()
        systemListExam.removeAll()
        for exam in listExam{
            if exam.user_create != nil{
                userListExam.append(exam)
            }else{
                systemListExam.append(exam)
            }
        }
        tableView.reloadData()
    }
}

extension ExamHistoryViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return systemListExam.count
        }else{
            return userListExam.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamViewCell") as! ExamViewCell

        switch indexPath.section {
        case 0:
            cell.title.text = systemListExam[indexPath.row].title
            cell.numberOfQuestion.text = "\(systemListExam[indexPath.row].number ?? 0) Trắc nghiệm"
            cell.thumbnail.sd_setImage(with: URL(string: systemListExam[indexPath.row].image!))
            cell.grade.text = "Điểm: \(systemListExam[indexPath.row].score!)"
            cell.id = systemListExam[indexPath.row].id
            return cell
        default:
            cell.title.text = userListExam[indexPath.row].title
            cell.numberOfQuestion.text = "\(userListExam[indexPath.row].number ?? 0) Trắc nghiệm"
            cell.thumbnail.sd_setImage(with: URL(string: userListExam[indexPath.row].image!))
            cell.grade.text = "Điểm: " + (userListExam[indexPath.row].score ?? "")
            cell.id = userListExam[indexPath.row].id
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Từ hệ thống"
        default:
            return "Từ người dùng"
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "ExamHistoryViewController1", bundle: nil).instantiateViewController(withIdentifier: "ExamHistoryViewController1") as! ExamHistoryViewController1
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}

extension ExamHistoryViewController{
    @IBAction func backAction(_sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { [self] action in
            switch action.title{
            case "Ngày":
                self.sort_field = 1
            case "Tên":
                self.sort_field = 2
            default:
                self.sort_field = 3
            }
            getExamHistoryList()
            tableView.reloadData()
        }
        let menu = UIMenu(children : [
            UIAction(title: "Ngày", state: .off, handler: optionClosure),
            UIAction(title: "Tên", state: .off, handler: optionClosure),
            UIAction(title: "Điểm", state: .off, handler: optionClosure)
        ])
        filterBtn.menu = menu
        filterBtn.showsMenuAsPrimaryAction = true
        filterBtn.changesSelectionAsPrimaryAction = false
    }
    
   
}
