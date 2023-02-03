//
//  Introduce3ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 03/02/2023.
//

import UIKit

class Introduce3ViewController: UIViewController {
    var currentPage = 2
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
    }
    
    func setBackground(){
        image.image = UIImage(named: "Illustration-2")
        label.text = "Tham gia thử thách cùng bạn bè"
        pageControl.currentPage = currentPage
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
