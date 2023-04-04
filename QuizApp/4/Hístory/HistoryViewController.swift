//
//  HistoryViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var firstSubView: UIView!
    @IBOutlet weak var secondSubView: UIView!
    @IBOutlet weak var thirdSubView: UIView!

    var tapGesture1 = UITapGestureRecognizer()
    var tapGesture3 = UITapGestureRecognizer()
    var tapGesture2 = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSubView(firstSubView )
        layoutSubView(secondSubView)
        layoutSubView(thirdSubView)
        
        didTapFirstView()
        // Do any additional setup after loading the view.
    }
    
    func layoutSubView(_ view: UIView){
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    func didTapFirstView(){
        tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1(_:)))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1
        firstSubView.addGestureRecognizer(tapGesture1)
        firstSubView.isUserInteractionEnabled = true
        
        
        tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        secondSubView.addGestureRecognizer(tapGesture2)
        secondSubView.isUserInteractionEnabled = true

        tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1
        thirdSubView.addGestureRecognizer(tapGesture3)
        thirdSubView.isUserInteractionEnabled = true

    }
    
    @objc func handleTap1(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "ExamHistoryViewController", bundle: nil).instantiateViewController(withIdentifier: "ExamHistoryViewController") as! ExamHistoryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleTap3(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "QuestionHistoryViewController", bundle: nil).instantiateViewController(withIdentifier: "QuestionHistoryViewController") as! QuestionHistoryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleTap2(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "SavedViewController", bundle: nil).instantiateViewController(withIdentifier: "SavedViewController") as! SavedViewController
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
