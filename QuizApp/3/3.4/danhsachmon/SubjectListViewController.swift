//
//  SubjectListViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/17/23.
//

import UIKit

class SubjectListViewController: UIViewController{
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var textInput : UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    var headerTitle = [
        "Khoa Tự nhiên", "Khoa khoa học"
    ]
    
    var data = [
        Subject(thumnail: "Frame", title:"Môn toán" , field: "Khoa Tự Nhiên", count: 140),
        Subject(thumnail: "Frame", title:"Môn Hóa" , field: "Khoa Tự Nhiên", count: 130),
        Subject(thumnail: "Frame", title:"Môn Lý" , field: "Khoa Tự Nhiên", count: 144),
    ]
    
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
    }
    
    func registerNib(){
        let nib = UINib(nibName: "SubjectCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SubjectCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension SubjectListViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell") as! SubjectCell
        cell.title.text = data[indexPath.row].title
        cell.thumnail.image = UIImage(named: data[indexPath.row].thumnail)
        cell.field.text = data[indexPath.row].field
        cell.count.text = String(data[indexPath.row].count) + " đề"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "TestListViewController", bundle: nil).instantiateViewController(withIdentifier: "TestListViewController") as! TestListViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width),
//                                                       height: Int(50)))
//
//        let title: UILabel = UILabel()
//        title.text = "222222"
//        title.textAlignment = .left
//        title.backgroundColor = UIColor.black
//        title.font = UIFont(name: "SVN-Gilroy Medium", size: 20)
//        headerView.addSubview(title)
//        headerView.backgroundColor = .gray
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50
//    }
}

extension SubjectListViewController{
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
}
