//
//  ProfileViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//

import UIKit
import SwiftUICharts
import MBCircularProgressBar
class ProfileViewController: UIViewController{

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var filterbtn: UIButton!
    @IBOutlet weak var roundChart : MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
        filterbtn.layer.cornerRadius = 10
        
        //        let barChart = BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Sales", legend: "Quarterly")  // legend is optional
        //
        //        view.addSubview(barChart)
        roundChart.value = 0
        UIView.animate(withDuration: 2.0, delay: 0.5, options: [.curveEaseIn], animations: {
            self.roundChart.value = 60 // Set the target value of progress bar
        }, completion: nil)
        
    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setUpAction(_ sender: Any) {
        let vc = UIStoryboard(name: "SetUpViewController", bundle: nil).instantiateViewController(withIdentifier: "SetUpViewController") as! SetUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
