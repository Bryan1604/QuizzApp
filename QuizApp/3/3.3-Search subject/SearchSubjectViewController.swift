//
//  SearchSubjectViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 5/29/23.
//

import UIKit
import SDWebImage
import SwiftOverlays
class SearchSubjectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var textInput: UITextField!
    
    var department_id: Int?
    var keyword: String?
    var subjectList: [SearchSubjectResponse.Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        searchView.layer.cornerRadius = 20
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
        registerNib()
        
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = SearchSubjectRequest.Post(user_id: user_id,department_id: self.department_id, keyword: "").route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let searchSubjectResponse = try?
            decoder.decode(SearchSubjectResponse.self, from: data) {
                self.subjectList = searchSubjectResponse.result
                self.tableView.reloadData()
            }
        }
    }
    */
    func registerNib(){
        tableView.register(UINib(nibName: "SubjectCell", bundle: nil), forCellReuseIdentifier: "SubjectCell")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    @IBAction func searchSubject(){
        self.showWaitOverlay()
        self.keyword = textInput.text
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = SearchSubjectRequest.Post(user_id: user_id,department_id: self.department_id, keyword: keyword).route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let searchSubjectResponse = try?
            decoder.decode(SearchSubjectResponse.self, from: data) {
                self.removeAllOverlays()
                self.subjectList = searchSubjectResponse.result
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func backAction(){
        navigationController?.popViewController(animated: true)
    }
}

extension SearchSubjectViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        return headerView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as! SubjectCell
        cell.title.text = subjectList[indexPath.row].title
        
        cell.thumnail.sd_setImage(with: URL(string: subjectList[indexPath.row].image ?? ""))
        cell.thumnail.image = UIImage(named: "Frame_1")
        cell.field.text = subjectList[indexPath.row].description
        cell.count.text = "\(subjectList[indexPath.row].count_exam ?? 0) đề"
        cell.id = subjectList[indexPath.row].id
        return cell
    }
    
    
}
