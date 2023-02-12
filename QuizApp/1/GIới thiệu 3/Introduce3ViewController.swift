//
//  Introduce3ViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 03/02/2023.
//

import UIKit

class Introduce3ViewController: UIViewController {
    //var currentPage = 2
    
    //@IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setBackground()
    }
    
    func setBackground(){
        //image.image = UIImage(named: "Illustration-2")
        //label.text = "Tham gia thử thách cùng bạn bè"
        //pageControl.currentPage = currentPage
    }
    
    @IBAction func didTapButton(){
        let storyboard4 = UIStoryboard(name: "Introduce4ViewController", bundle: nil)
        let introduce4 = storyboard4.instantiateViewController(withIdentifier: "Introduce4ViewController") as! Introduce4ViewController
        navigationController?.pushViewController(introduce4, animated: false)
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
