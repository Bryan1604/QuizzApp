//
//  StartTestViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/22/23.
//

import UIKit

class StartTestViewController: UIViewController {

    @IBOutlet weak var parentTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var viewChild1: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var viewChild2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewChild1.layer.cornerRadius = 20
        startBtn.layer.cornerRadius = 20
        viewChild2.layer.cornerRadius = 20
    }
    
    @IBAction func goBack(){
        navigationController?.popViewController(animated: true)
    }

    @IBAction func start(){
        let vc = UIStoryboard(name: "TestDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "TestDetailViewController") as! TestDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
