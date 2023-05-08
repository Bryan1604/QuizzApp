//
//  CheckViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/27/23.
//

import UIKit
import Charts
import MBCircularProgressBar
import ANDLineChartView

class CheckViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var viewResultBtn: UIButton!
    @IBOutlet weak var charView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var parentViewChart: UIView!
    @IBOutlet weak var reTestBtn : UIButton!
    @IBOutlet weak var doneBtn : UIButton!
    @IBOutlet weak var lineChartView: UIView!
    var pieChart = PieChartView()
    var LineChart = LineChartView()
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        parentViewChart.layer.cornerRadius = 20
        viewResultBtn.layer.cornerRadius = 20
        viewResultBtn.backgroundColor = .white.withAlphaComponent(0.3)
        doneBtn.layer.cornerRadius = 20
        reTestBtn.layer.cornerRadius = 20      //
        pieChart.delegate = self
        //addPieChart()
        addLineChart()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressView!.value = 0

        UIView.animate(withDuration: 1.0){
            self.progressView.value = 80
        }
        
    }
    /*
     func addPieChart(){
     pieChart.frame = CGRect(x: 0, y: 0,
     width: (self.charView?.frame.size.width ?? 0)*1.5,
     height: (self.charView?.frame.size.height ?? 0)*1.5)
     //pieChart.center = charView.center
     charView.addSubview(pieChart)
     let horizontalConstraint = NSLayoutConstraint(item: pieChart, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentViewChart, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
     let verticalConstraint = NSLayoutConstraint(item: pieChart, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parentViewChart, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
     parentViewChart.addConstraints([horizontalConstraint, verticalConstraint])
     
     let correctAnswer = PieChartDataEntry(value: 0)
     let totalAnswer = PieChartDataEntry(value: 0)
     
     var entries = [ChartDataEntry]()
     totalAnswer.value = 100
     correctAnswer.value = 80
     //pieChart.chartDescription.text = "\(correctAnswer.value)" + "/" + "\(totalAnswer.value)" + " Câu hỏi"
     entries = [correctAnswer,totalAnswer]
     //        for x in 0..<10{
     //            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
     //        }
     let set = PieChartDataSet(entries: entries)
     //set.colors = [UIColor(red: 255, green: 214, blue: 221, alpha: 0), UIColor(red: 255, green: 255, blue: 255, alpha: 0)]
     set.colors = ChartColorTemplates.colorful()
     let data = PieChartData(dataSet: set)
     pieChart.data = data
     pieChart.shouldHideToolbarPlaceholder = true
     
     }
     */
     /*
    func addPieChart(){
        //let superView = charView.superview // lấy lớp cha của charView
        //let centerInSuperview = charView.convert(charView.center, to: superView) // tính toán giá trị center của charView trong hệ tọa độ của lớp cha
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 75, startAngle: 0, endAngle: .pi*2, clockwise: true)

        let shape = CAShapeLayer()
        shape.path = circlePath.cgPath
        shape.lineWidth = 7
        shape.strokeColor = UIColor.blue.cgColor
        charView.layer.addSublayer(shape)
    }
      */
    func addLineChart(){
        LineChart.frame = CGRect(x: 0, y: 0,
                                width: (self.lineChartView?.frame.size.width ?? 0),
                                height: self.lineChartView?.frame.size.height ?? 0)
        pieChart.center = lineChartView.center
        lineChartView.addSubview(LineChart)

        //addContraint(newView: LineChart, view: lineChartView)

        let test = ["1","2","3", "4", "5", "6", "7", "8", "9", "10"]
        let numberOfCorrectAns = [30,4,6,7,8,9,4,23,14, 24]

        var entries  = [ChartDataEntry]()
        for i in 0..<test.count{
            entries.append(ChartDataEntry(x: Double(i), y: Double(numberOfCorrectAns[i])))
        }
        let set = LineChartDataSet(entries: entries, label: "Số câu đúng")
        set.colors = [UIColor(red: 99, green: 156, blue: 253, alpha: 0)]
        let data = LineChartData(dataSet: set)
        LineChart.data = data
        LineChart.animate(xAxisDuration: 2, easingOption: .easeInBounce)
        LineChart.animate(yAxisDuration: 2, easingOption: .easeInBounce)
//        let lineChart = ANDLineChartView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
//        lineChartView.addSubview(lineChart)
/*
        let data = [
            
            ANDLineChartViewPoint(x: 1, y: 20),
            ANDLineChartViewPoint(x: 2, y: 10),
            ANDLineChartViewPoint(x: 3, y: 30),
            ANDLineChartViewPoint(x: 4, y: 15),
            ANDLineChartViewPoint(x: 5, y: 25)
        ]
        lineChart.addLine(data)
        lineCh
        // Tùy chỉnh màu của đường biểu đồ
        lineChart.lineColor = UIColor.red

        // Tùy chỉnh độ rộng của đường biểu đồ
        lineChart.lineWidth = 2

        // Tùy chỉnh màu của điểm trên đường biểu đồ
        lineChart.dotColor = UIColor.red

        // Tùy chỉnh độ lớn của điểm trên đường biểu đồ
        lineChart.dotSize = 10

        // Tùy chỉnh màu của vùng bao quanh đường biểu đồ
        lineChart.fillColor = UIColor.red.withAlphaComponent(0.5)

        // Tùy chỉnh màu của nền của biểu đồ
        lineChart.backgroundColor = UIColor.white

        // Tùy chỉnh các thông số khác của biểu đồ
        lineChart.xAxisLabelFont = UIFont.systemFont(ofSize: 12)
        lineChart.yAxisLabelFont = UIFont.systemFont(ofSize: 12)
        lineChart.yAxisLabelFormat = "%.1f"
        lineChart.xAxisLabelColor = UIColor.black
        lineChart.yAxisLabelColor = UIColor.black
        lineChart.showCoordinateAxis = true
        lineChart.animate(duration: 1.0)
*/

    }
//    func addContraint(newView: LineChartView, view: UIView){
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
//        //let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 0)
//        //let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//        view.addConstraints([horizontalConstraint, verticalConstraint])
//    }
    @IBAction func popToRootView(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
