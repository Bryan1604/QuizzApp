//
//  ExamHistoryViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/23/23.
//

import UIKit

class ExamHistoryViewController: UIViewController{

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    var sort_field : Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        searchView.layer.cornerRadius = 20
        searchView.layer.borderColor = .init(gray: 24, alpha: 1)
        registerCell()
    }
    
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { action in
            if action.title == "Ngày"{
                self.sort_field = 1
            }
            else if action.title == "Tên"{
                self.sort_field = 2
            }
            else {
                self.sort_field = 3
            }
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
    
    func registerCell(){
        tableView.register(UINib(nibName: "ExamViewCell", bundle: nil), forCellReuseIdentifier: "ExamViewCell")
    }
    
}

extension ExamHistoryViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamViewCell") as! ExamViewCell
        cell.title.text = "De 1"
        cell.numberOfQuestion.text = "Question 10"
        cell.thumbnail.image = UIImage(named: "Frame_1")
        cell.grade.text = "0"
        cell.id = 1
//        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "ExamHistoryViewController1", bundle: nil).instantiateViewController(withIdentifier: "ExamHistoryViewController1") as! ExamHistoryViewController1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExamHistoryViewController{
    @IBAction func backAction(_sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
