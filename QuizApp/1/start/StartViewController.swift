//
//  StartViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 30/01/2023.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var button: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        let storyboard = UIStoryboard(name: "StartViewController", bundle: nil)
//        // gán storyboard với controller -> tạo màn hình số 10
//        let startView = storyboard.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
//        // navigation push
//        navigationController?.pushViewController( startView, animated: true)
//        startView.setBackground()
        setBackground()
        
    }
    
    func setBackground(){
        image?.image = UIImage(named: "Logo")
        button?.setTitle("next", for: .normal)
        //self.view.backgroundColor = UIColor.
    }
    
    @IBAction func didTapButton(){
            // gọi storyboard
        let storyboard = UIStoryboard(name: "Introduce1ViewController", bundle: nil)
        let introduce1 = storyboard.instantiateViewController(withIdentifier: "Introduce1ViewController") as! Introduce1ViewController
        let rootView = UINavigationController(rootViewController: introduce1)
        present(rootView,animated:true)
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
