//
//  SavedViewController1.swift
//  QuizApp
//
//  Created by Luong Vu on 4/1/23.
//

import UIKit

class SavedViewController1: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAll: UILabel!
    
    var user_id: Int!
    var department_id: Int!
    var department_title: String!
    var savedSubjectList: [SavedSubjectResponse.Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        titleLabel.text = department_title
        registerNib()
        getSavedSubject()
    }
    
    func registerNib(){
        let nib = UINib(nibName: "SubjectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SubjectCell")
    }
    
    @IBAction func backAction(){
        self.navigationController?.popViewController(animated: true)
    }

}

extension SavedViewController1: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedSubjectList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell") as! SubjectCell
        
        cell.title.text = savedSubjectList?[indexPath.row].title
        cell.thumnail.sd_setImage(with: URL(string: savedSubjectList?[indexPath.row].image ?? ""))
        cell.field.text = savedSubjectList?[indexPath.row].department_title
        cell.count.text = "\(savedSubjectList?[indexPath.row].exam_number ?? 0) đề"
        cell.id = savedSubjectList?[indexPath.row].id
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SubjectCell
        let vc = UIStoryboard(name: "SavedViewController2", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController2") as! SavedViewController2
        vc.user_id = user_id
        vc.subject_id = cell.id
        vc.subject_title = cell.title.text
        vc.type = 0
        vc.sort_by = "asc"
        vc.sort_field = 1
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SavedViewController1{
    func getSavedSubject(){
        let request = SavedSubjectRequest.Post(user_id: user_id!, department_id: department_id! ).route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let savedSubjectResponse = try? decoder.decode(SavedSubjectResponse.self, from: data) {
                self.savedSubjectList = savedSubjectResponse.result
                self.tableView.reloadData()
            }
        }
    }
}
