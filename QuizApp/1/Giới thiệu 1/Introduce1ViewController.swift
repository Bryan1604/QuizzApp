//
//  Introduce1ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit

class Introduce1ViewController: UIViewController {

    var currentPage = 0
    
    @IBOutlet var pageControl: UIPageControl!
    //@IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        print("check")
    }
    
    func setBackground(){
        //image.image = UIImage(named: "Illustration")
        label.text = "Tạo các câu đố được chơi game trở nên đơn giản"
        pageControl.currentPage = currentPage
    }
    
    @IBAction func didTapButton(){
        let storyboard2 = UIStoryboard(name: "Introduce2ViewController", bundle: nil)
        let introduce2 = storyboard2.instantiateViewController(withIdentifier: "Introduce2ViewController") as! Introduce2ViewController
        navigationController?.pushViewController(introduce2, animated: false)
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
