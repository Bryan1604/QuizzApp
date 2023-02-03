//
//  Introduce1ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit

class Introduce1ViewController: UIViewController {

    var currentPage = 0
    var data = [
        Page(image: "Illustration", title: "Tạo các câu đố được chơi game trở nên đơn giản", currentPage: 0),
        Page(image: "Illustration-1", title: "Tìm các câu đố để kiểm tra kiến ​​thức của bạn", currentPage: 1),
        Page(image: "Illustration-2", title: "TTham gia thử thách cùng bạn b", currentPage: 2)
    ]
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var image: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        //PageControl()
        // Do any additional setup after loading the view.
    }
    
    func setBackground(){
        image.image = UIImage(named: data[0].image)
        label.text = data[0].title
        pageControl.currentPage = currentPage
    }
    
    @IBAction func setPage(){
        image.image = UIImage(named: data[currentPage+1].image)
        label.text = data[currentPage+1].title
        pageControl.currentPage = data[currentPage+1].currentPage
        
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
