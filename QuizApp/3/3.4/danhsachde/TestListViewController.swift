//
//  TestListViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/21/23.
//

import UIKit

class TestListViewController: UIViewController{
    
    @IBOutlet weak var backBtn : UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //    let vc = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    
    var data2 = [
        Test(thumnail: "Frame", title: "Đề 1", parentTitle: "Toán học", quantity: 12),
        Test(thumnail:"Frame_1" , title: "Đề 2", parentTitle: "Toán học", quantity: 13),
        Test(thumnail: "Frame_2", title: "Đề 3", parentTitle: "Toán học", quantity: 14),
        Test(thumnail:"Frame" , title: "Đề 4", parentTitle: "Toán học", quantity: 16),
        Test(thumnail: "Frame_2", title: "Đề 5", parentTitle: "Toán học", quantity: 20),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchView.layer.cornerRadius = 20
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        registerNib()
        
        //setPopupButton()
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

extension TestListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
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
        cell.parentTitle.text = data2[indexPath.row].parentTitle
        cell.quantity.text = "・" + "\(data2[indexPath.row].quantity)" + " Trăc nghiệm"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data2[section].parentTitle + " | Khoa học"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "StartTestViewController", bundle: nil).instantiateViewController(withIdentifier: "StartTestViewController") as! StartTestViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
