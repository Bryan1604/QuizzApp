//
//  CheckViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/27/23.
//

import UIKit
import Charts
class CheckViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var viewResultBtn: UIButton!
    @IBOutlet weak var charView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var parentViewChart: UIView!
    var pieChart = PieChartView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //
        parentViewChart.layer.cornerRadius = 20
        viewResultBtn.layer.cornerRadius = 20
        viewResultBtn.backgroundColor = .white.withAlphaComponent(0.3)
        //
        pieChart.delegate = self
        addChart()
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
    func addChart(){
        pieChart.frame = CGRect(x: 0, y: 0,
                               width: (self.charView?.frame.size.width ?? 0),
                               height: self.charView?.frame.size.height ?? 0)
        pieChart.center = charView.center
        charView.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        for x in 0..<10{
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
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
