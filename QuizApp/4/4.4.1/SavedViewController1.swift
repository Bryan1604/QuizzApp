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
    
    var data = [
        Subject(thumnail: "Frame", title:"Môn toán" , field: "Khoa Tự Nhiên", count: 140),
        Subject(thumnail: "Frame", title:"Môn Hóa" , field: "Khoa Tự Nhiên", count: 130),
        Subject(thumnail: "Frame", title:"Môn Lý" , field: "Khoa Tự Nhiên", count: 144),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        registerNib()
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
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell") as! SubjectCell
        cell.title.text = data[indexPath.row].title
        cell.thumnail.image = UIImage(named: data[indexPath.row].thumnail)
        cell.field.text = data[indexPath.row].field
        cell.count.text = String(data[indexPath.row].count) + " đề"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "SavedViewController2", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController2") as! SavedViewController2
        navigationController?.pushViewController(vc, animated: true)
    }
}
