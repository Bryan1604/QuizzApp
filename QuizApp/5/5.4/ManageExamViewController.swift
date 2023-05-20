//
//  ManageExamViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 5/19/23.
//

import UIKit

class ManageExamViewController: UIViewController {

    @IBOutlet weak var seachInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchSubView: UIView!
    
    var listUploadExam : [GetUploadExamResponse.Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchSubView.layer.cornerRadius = 20
        searchSubView.layer.borderWidth = 1
        searchSubView.layer.borderColor = CGColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "testCell", bundle: nil), forCellReuseIdentifier: "testCell")
    }
    
    func getUploadExam(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetUploadExamRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getUploadExamResponse = try? decoder.decode(GetUploadExamResponse.self, from: data) {
                self.listUploadExam = getUploadExamResponse.result
            }
        }
    }
}

extension ManageExamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUploadExam?.count ?? 0
    }
    
    // Thieu data tra ve : id, image
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! testCell
        cell.title.text = listUploadExam?[indexPath.row].title
        //cell.thumnail.sd_setImage(with: URL(string: listExam[indexPath.row].image ?? ""))
        //cell.parentTitle.text = "Toan"
        cell.quantity.text = "・" + " \(listUploadExam?[indexPath.row].number ?? 0) Trăc nghiệm"
        cell.id = indexPath.row
        return cell
    }
    
    
}
