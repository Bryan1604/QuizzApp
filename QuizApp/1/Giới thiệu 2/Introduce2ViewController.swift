//
//  Introduce1ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit

class Introduce2ViewController: UIViewController {

    var currentPage = 1
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    func setBackground(){
        image.image = UIImage(named: "Illustration-3")
        label.text = "Tìm các câu đố để kiểm tra kiến ​​thức của bạn"
        pageControl.currentPage = currentPage
    }
    
    @IBAction func didTapButton(){
        let storyboard = UIStoryboard(name: "Introduce3ViewController", bundle: nil)
        let introduce1 = storyboard.instantiateViewController(withIdentifier: "Introduce3ViewController") as! Introduce3ViewController
        navigationController?.pushViewController(introduce1, animated: true)
        
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

struct Page{
    let image: String
    let title: String
    let currentPage: Int
}
