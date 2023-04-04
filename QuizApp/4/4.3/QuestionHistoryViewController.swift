//
//  QuestionHistoryViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class QuestionHistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        registerNib()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    func registerNib(){
        tableView.register(UINib(nibName: "TestTableViewCell", bundle: nil), forCellReuseIdentifier: "TestTableViewCell")
    }
    
    @IBAction func backAction(_ sender : AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
}

extension QuestionHistoryViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        cell.title.text = "Đề " + "\(indexPath.row + 1)"
        cell.subTitle.text = "Toán" + "・12 Trắc nghiệm"
        cell.thumnail.image = UIImage(named: "Frame")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "QuestionHistoryViewController1", bundle: nil).instantiateViewController(withIdentifier: "QuestionHistoryViewController1") as! QuestionHistoryViewController1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
