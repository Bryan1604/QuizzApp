//
//  SavedViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/1/23.
//

import UIKit

class SavedViewController: UIViewController {

    var data = [
        ScienceField(thumnail: "Frame", title: "Khoa Tự Nhiên", detail: "Toán, Sinh, Lý, Hóa,..."),
        ScienceField(thumnail: "Frame_1", title: "Khoa Khoa Học", detail: "Nghiên cứu, Sáng tạo,..."),
        ScienceField(thumnail: "Frame_2", title: "Khoa Nhạc", detail: "Thanh nhạc, Dụng cụ,..."),
        ScienceField(thumnail: "Frame", title: "Khoa thể chất", detail: "Võ, Điền kinh, bóng đá,.."),
        ScienceField(thumnail: "Frame_1", title: "Khoa truyền thông", detail: "Báo chí, đa phương tiện,..")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        registerNib()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "ScienceFieldCell", bundle: nil), forCellReuseIdentifier: "ScienceFieldCell")
    }
    
    @IBAction func backAction(_ sender : AnyObject){
        self.navigationController?.popViewController(animated: true)
    }

}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "SavedViewController1", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController1") as! SavedViewController1
        navigationController?.pushViewController(vc, animated: true)
    }
}


