//
//  HomeViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 28/02/2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var data = [
        ScienceField(thumnail: "Frame", title: "Khoa Tự Nhiên", detail: "Toán, Sinh, Lý, Hóa,..."),
        ScienceField(thumnail: "Frame_1", title: "Khoa Khoa Học", detail: "Nghiên cứu, Sáng tạo,..."),
        ScienceField(thumnail: "Frame_2", title: "Khoa Nhạc", detail: "Thanh nhạc, Dụng cụ,...")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        
        registerNibHeader()
        registerNib()
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScienceFieldCell") as! ScienceFieldCell
        cell.thumnail.image = UIImage(named: data[indexPath.row].thumnail)
        cell.title.text = data[indexPath.row].title
        cell.detail.text = data[indexPath.row].detail
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

//extension HomeViewController : ScienceFieldCellDelegate{
//    func didTapButton() {
//        let vc = UIStoryboard(name: "SubjectListViewController", bundle: nil).instantiateViewController(withIdentifier: "SubjectListViewController") as! SubjectListViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//}

//extension HomeViewController: HomeHeaderTableViewCellDelegate{
//    func didTapLabel() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(<#T##@objc method#>))
//    }
//}



