//
//  HomeViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 28/02/2023.
//

import UIKit
import SDWebImage
import SwiftOverlays
class HomeViewController: UIViewController{
    @IBOutlet weak var homeTableView: UITableView!
    
    var data = GetDepartmentListResponse( result: [GetDepartmentListResponse.Result]())
    var departmentList = [Department]()
    var user_name: String!
    var user_avatar: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(0, forKey: "Type")
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        homeTableView.reloadData()
        
        registerNibHeader()
        registerNib()
        getDepartmentList()

       // UserDefaults.standard.removeObject(forKey: "AccessToken")
      //  print(UserDefaults.standard.string(forKey: "AccessToken") ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserInfo()
    }
    
    func registerNibHeader() {
        let nib = UINib(nibName: "HomeHeaderTableViewCell", bundle: nil)
        homeTableView?.register(nib,forHeaderFooterViewReuseIdentifier: "HomeHeaderTableViewCell")
    }
    
    func registerNib(){
        homeTableView.register(UINib(nibName: "ScienceFieldCell", bundle: nil), forCellReuseIdentifier: "ScienceFieldCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
 
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departmentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScienceFieldCell") as! ScienceFieldCell
        cell.title.text = departmentList[indexPath.row].title
        cell.detail.text = departmentList[indexPath.row].description
        cell.thumnail.sd_setImage(with: URL(string: departmentList[indexPath.row].image ?? ""))
        cell.id = departmentList[indexPath.row].id
//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else {
            return nil
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeHeaderTableViewCell") as! HomeHeaderTableViewCell
        //headerView.delegate = self
        headerView.name?.text = self.user_name
        headerView.avatar?.sd_setImage(with: URL(string: user_avatar ?? ""))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 430 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "SubjectListViewController", bundle: nil).instantiateViewController(withIdentifier: "SubjectListViewController") as! SubjectListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController{
    func getDepartmentList(){
        self.showWaitOverlay()
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        print(UserDefaults.standard.string(forKey: "AccessToken"))
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: "").route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getDepartmentListResponse = try?
            decoder.decode(GetDepartmentListResponse.self, from: data) {
                if getDepartmentListResponse.statusCode == 401{
                    self.navigationController?.popToRootViewController(animated: true)
                }else{
                        self.removeAllOverlays()
                        let departments = getDepartmentListResponse.result
                        if departments.count > 0{
                            for i in stride(from: 0, to: departments.count, by: 1){
                                let department = Department(id: departments[i].id, title: departments[i].title, description: departments[i].description, image: departments[i].image, studentList: departments[i].student_list)
                                    self.departmentList.append(department)
                            }
                        }
                    DispatchQueue.main.async {
                        self.homeTableView.reloadData()
                    }
                }
            }
                print(json)
                }
        
        }
    func getUserInfo(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetUserInfoRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
                self.user_name = getUserInfoResponse.result?.name
                self.user_avatar = getUserInfoResponse.result?.avatar
                self.homeTableView.reloadData()
                
            }
        }
    }
    
    
    
}
