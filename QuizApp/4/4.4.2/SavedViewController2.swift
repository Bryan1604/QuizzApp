//
//  SavedViewController2.swift
//  QuizApp
//
//  Created by Luong Vu on 4/2/23.
//

import UIKit

class SavedViewController2: UIViewController{
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
        
    var data2 = [
        Test2(thumnail: "Frame", title: "Đề 1: Số phức", numberOfCreate: 102, maker: "Vu Duc Luong"),
        Test2(thumnail: "Frame_1", title: "Đề 2: Bất phương trình", numberOfCreate: 102, maker: "Vu Duc Luong"),
        Test2(thumnail: "Frame_2", title: "Đề 3: Hệ Phương trình", numberOfCreate: 102, maker: "Vu Duc Luong"),
        Test2(thumnail: "Frame", title: "Đề 4: Logarit", numberOfCreate: 102, maker: "Vu Duc Luong")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        registerNib()
    }
        
    func registerNib(){
        tableView.register(UINib(nibName: "testCell", bundle: nil), forCellReuseIdentifier: "testCell")
    }
        
    @IBAction func goBack(){
            navigationController?.popViewController(animated: true)
        }
        
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { action in
        }
        let menu = UIMenu(children : [
            UIAction(title: "Theo thời gian", state: .off, handler: optionClosure),
            UIAction(title: "Só lượng tạo", state: .off, handler: optionClosure),
            UIAction(title: "Môn học", state: .off, handler: optionClosure)
        ])
        filterBtn.menu = menu
        filterBtn.showsMenuAsPrimaryAction = true
        filterBtn.changesSelectionAsPrimaryAction = false
    }
}

extension SavedViewController2: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data2.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! testCell
            
            cell.title.text = data2[indexPath.row].title
            cell.thumnail.image = UIImage(named: data2[indexPath.row].thumnail)
            cell.parentTitle.text = "Số lượt tạo: " + "\(data2[indexPath.row].numberOfCreate)"
            cell.quantity.text = "| Người tạo: "  + data2[indexPath.row].maker
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = UIStoryboard(name: "StartTestViewController", bundle: nil).instantiateViewController(withIdentifier: "StartTestViewController") as! StartTestViewController
            navigationController?.pushViewController(vc, animated: true)
        }
}
