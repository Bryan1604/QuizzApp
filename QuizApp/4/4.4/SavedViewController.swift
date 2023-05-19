//
//  SavedViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/1/23.
//

import UIKit
import Alamofire
import SDWebImage
class SavedViewController: UIViewController {
    var deparmentList = [SavedDepartmentResponse.Result]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        registerNib()
        self.navigationController?.isNavigationBarHidden = true
        getSavedDepartment()
        
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "ScienceFieldCell", bundle: nil), forCellReuseIdentifier: "ScienceFieldCell")
    }
    
    @IBAction func backAction(_ sender : AnyObject){
        self.navigationController?.popViewController(animated: true)
    }

}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deparmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScienceFieldCell") as! ScienceFieldCell
        cell.title.text = deparmentList[indexPath.row].title
        cell.detail.text = deparmentList[indexPath.row].description
        cell.thumnail.sd_setImage(with: URL(string: deparmentList[indexPath.row].image ?? ""))
        cell.id = deparmentList[indexPath.row].id
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "SavedViewController1", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController1") as! SavedViewController1
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SavedViewController{
    func getSavedDepartment(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        
        let request = SavedDepartmentRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let savedDepartment = try? decoder.decode(SavedDepartmentResponse.self, from: data) {
                self.deparmentList = savedDepartment.result!
                self.tableView.reloadData()
                
            }
        }
    }
}
