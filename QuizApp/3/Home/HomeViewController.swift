//
//  HomeViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 28/02/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var homeTableView: UITableView!
    var data = GetDepartmentListResponse( result: [GetDepartmentListResponse.Result]())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        
        registerNibHeader()
        registerNib()

        getDepartmentList()
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
        return data.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScienceFieldCell") as! ScienceFieldCell
        if let url = URL(string: data.result[indexPath.row].image!) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    cell.thumnail.image = UIImage(data: data)
                    // Use the downloaded image
                }
            }.resume()
        }
        cell.title.text = data.result[indexPath.row].title
        cell.detail.text = data.result[indexPath.row].description
        cell.id = data.result[indexPath.row].id
        //cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else{
            return nil
        }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeHeaderTableViewCell") as! HomeHeaderTableViewCell
        headerView.name?.text = "Vu duc luong"
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
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: "").route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getDepartmentListResponse = try? decoder.decode(GetDepartmentListResponse.self, from: data) {
                self.data.result = getDepartmentListResponse.result
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                }
            }
        
        
        }
    
}


