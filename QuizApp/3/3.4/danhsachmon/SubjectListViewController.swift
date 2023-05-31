//
//  SubjectListViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/17/23.
//

import UIKit
import SDWebImage

class SubjectListViewController: UIViewController{
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var textInput : UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    var headerTitle = [String]()
    var khoa = ListDepartmentInfoResponse(result: [ListDepartmentInfoResponse.Result]())
    
    var subjectList : [Subject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        
        searchView.layer.cornerRadius = 20
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        tableView.layer.cornerRadius = 20
        tableView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        registerNib()
        listDepartmentInfo()
    }
    
    func registerNib(){
        let nib = UINib(nibName: "SubjectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SubjectCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return khoa.result.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension SubjectListViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return khoa.result[section].subjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell") as! SubjectCell

        let data = khoa.result[indexPath.section].subjects![indexPath.row]
        cell.title.text = data.title
        cell.thumnail.sd_setImage(with: URL(string: data.image ?? ""))
        cell.field.text = khoa.result[indexPath.section].title
        cell.count.text = String(indexPath.row) + " đề"
        cell.id = data.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return khoa.result[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SubjectCell
        let subject_id = cell.id
        UserDefaults.standard.set(subject_id, forKey: "SubjectId")
        let vc = UIStoryboard(name: "TestListViewController", bundle: nil).instantiateViewController(withIdentifier: "TestListViewController") as! TestListViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SubjectListViewController{
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func listDepartmentInfo(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = ListDepartmentInfoRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let listDepartmentInfoResponse = try? decoder.decode(ListDepartmentInfoResponse.self, from: data) {
                self.khoa.result = listDepartmentInfoResponse.result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func searchBtnTapped(_ sender: UIButton){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let department_id = UserDefaults.standard.integer(forKey: "DepartmentId")
        let keyword = textInput.text
        let request = SearchSubjectRequest.Post(user_id: user_id, department_id: department_id, keyword: keyword ).route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let searchSubjectResponse = try? decoder.decode(SearchSubjectResponse.self, from: data) {
                let subjects = searchSubjectResponse.result
                for i in stride(from: 0, to: subjects.count, by: 1){
                    let subject = Subject(id: subjects[i].id,title: subjects[i].title,image: subjects[i].image, description: subjects[i].description, count_exam:subjects[i].count_exam )
                    self.subjectList.append(subject)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

