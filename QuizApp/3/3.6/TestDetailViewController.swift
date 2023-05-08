//
//  TestDetailViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/22/23.
//

import UIKit
import Popover
import KUIPopOver
import SDWebImage
class TestDetailViewController: UIViewController, UIPopoverPresentationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listQuestion!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionCell", for: indexPath) as! QuestionCollectionCell
        cell.numberOfQuestion?.text = "\(indexPath.row + 1)"
        if question_id == indexPath.row + 1{
            cell.questionCell?.layer.backgroundColor = UIColor.init(red: 99/255, green: 156/255, blue: 253/255, alpha: 1).cgColor // mau cua cell da duoc chon va dang hien thi cau hoi cua cell nay
            cell.numberOfQuestion?.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }else if listQuestion?[indexPath.row].is_selected == true {
            cell.select = true
        } else{
            cell.select = false
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        question_id = indexPath.row + 1
        tableView.reloadData()
        collectionView.reloadData()
      
    }
    
    
    @IBOutlet weak var backScreenBtn: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var questionMenu: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var previousQuestion: UIButton!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var listOfQuestionViewPopup: UIView!
    @IBOutlet weak var listOfQuestion: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
//    var timer: Timer?
//    var startTime: TimeInterval = 0
    var selectedIndexPath: IndexPath?
    var listQuestion: [ExamListQuestionResponse.Result.ExamQuestion]?
    var question_id: Int!
    
    var answerList = [Answer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        
        submitBtn.layer.cornerRadius = 20
        popupView.layer.cornerRadius = 20
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.8, height: 218)
        timeSlider.thumbTintColor = UIColor.clear
        //timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        registerNib()
        getListExam()
    }
    @IBAction func back(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func presentPopUpOfQuestion(_ sender: UIButton){
        /*
        let storyBoard = UIStoryboard(name: "PopUpViewController", bundle: nil)
        let popoverViewController = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
         popoverViewController.modalPresentationStyle = .popover

            let popoverPresentationController = popoverViewController.popoverPresentationController
            popoverPresentationController?.permittedArrowDirections = .up
            popoverPresentationController?.sourceView = sender
            popoverPresentationController?.sourceRect = sender.bounds

        var frame = popoverViewController.view.frame

        let newWidth: CGFloat = 380
        let newHeight: CGFloat = 300
        // Update the frame to the new size
        frame.size.width = newWidth
        frame.size.height = newHeight

        // Set the view controller's view frame to the updated frame
        popoverViewController.view.frame = frame
        
            // Get the position of the button
            let buttonPosition = sender.convert(CGPoint.zero, to: self.view)

            let options = [
                .type(.up),
                .cornerRadius(20)
            ] as [PopoverOption]
            let popover = Popover(options: options, showHandler: nil, dismissHandler: nil)
        popover.show(popoverViewController.view, fromView: sender)
        */
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 8
        collectionViewFlowLayout.minimumInteritemSpacing = 8
        collectionViewFlowLayout.sectionInset.bottom = 8
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 36, height: 135), collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "QuestionCollectionCell",bundle: nil),forCellWithReuseIdentifier: "QuestionCollectionCell")
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.itemSize = CGSize(width: 64, height: 64)
        let options = [
            .type(.up),
            .cornerRadius(20)
        ] as [PopoverOption]
        let popover = Popover(options: options, showHandler: nil, dismissHandler: nil)
        popover.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 0.85).cgColor
        popover.layer.borderWidth = 2
        popover.layer.cornerRadius = 20
        popover.blackOverlayColor = UIColor.clear
        popover.show(collectionView, fromView: sender)
       

    }
    // SU dung segue de hien thi Popover
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let popoverController = segue.destination.popoverPresentationController {
//                // Set the size of the popover
//                popoverController.popoverLayoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//
//                // Set the delegate for the popover presentation controller
//                popoverController.delegate = self
//            }
//    }
//
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }
    @IBAction func submitAction(_ sender: Any) {
        animateIn(designedView: blurView)
        animateIn(designedView: popupView)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }
    
    func animateIn(designedView: UIView){
        let backgroundView = self.view
        backgroundView?.addSubview(designedView)
        designedView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        designedView.alpha = 0
        designedView.center = backgroundView!.center
        UIView.animate(withDuration: 0.3,  animations: {
            designedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            designedView.alpha = 2
        })
    }
    
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    @IBAction func submit(_ sender: Any){
        let storyboard = UIStoryboard(name: "CheckViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CheckViewController") as! CheckViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    func registerNib(){
        tableView.register(UINib(nibName: "AnswerViewCell", bundle: nil), forCellReuseIdentifier: "AnswerViewCell")
        tableView.register(UINib(nibName: "HeaderQuestionViewCell", bundle: nil), forCellReuseIdentifier: "HeaderQuestionViewCell")
        tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "ImageViewCell")
    }
    
    func getListExam(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let exam_id = UserDefaults.standard.integer(forKey: "ExamId")
        
        let request = ExamListQuestionRequest.Post(user_id: user_id, exam_id: exam_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let examListQuestionResponse = try? decoder.decode(ExamListQuestionResponse.self, from: data) {
                self.listQuestion = examListQuestionResponse.result?.exam_question_list
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func goNextQuestion(_ sender: UIButton){
        if question_id < listQuestion!.count{
            question_id = question_id + 1
            selectedIndexPath = nil
            tableView.reloadData()
        } else{
            animateIn(designedView: blurView)
            animateIn(designedView: popupView)
        }
    }
    @IBAction func backToPreviousQuestion(_ sender: UIButton){
        if question_id > 1{
            question_id = question_id - 1
            selectedIndexPath = nil
            tableView.reloadData()
        }
    }
}

extension TestDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            if listQuestion?[question_id-1].question_image == "" {
                return 0
            }else{
                return 1
            }
        default:
                return listQuestion?[question_id-1].answer_list!.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderQuestionViewCell") as! HeaderQuestionViewCell
            cell.numberOfQuetion.text = "Câu \(question_id ?? 1) trên \(listQuestion?.count ?? 0)"
            cell.title.text = listQuestion?[question_id-1].question_title
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as! ImageViewCell
            cell.imageCell.sd_setImage(with: URL(string: (listQuestion?[question_id-1].question_image ?? "")))
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerViewCell") as! AnswerViewCell
            cell.id = listQuestion?[question_id-1].answer_list![indexPath.row].answer_id
            if listQuestion?[question_id-1].answer_id == cell.id && listQuestion?[question_id-1].is_selected == true{
                cell.select = true
            }else{
                cell.select = false
            }
            cell.content.text = listQuestion?[question_id-1].answer_list?[indexPath.row].content
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerViewCell") as! AnswerViewCell
//        cell.select = false
        listQuestion?[question_id-1].answer_id = .none
        tableView.reloadData()
        
        let selectCell = tableView.cellForRow(at: indexPath) as! AnswerViewCell
        selectCell.select = true
        listQuestion?[question_id-1].is_selected = true
        listQuestion?[question_id-1].answer_id = selectCell.id
    }

}
