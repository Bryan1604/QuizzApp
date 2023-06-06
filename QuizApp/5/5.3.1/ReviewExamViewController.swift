//
//  ReviewExamViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 5/22/23.
//

import UIKit

class ReviewExamViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    //@IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var goToNextQuestionBtn: UIButton!
    @IBOutlet weak var backToPreviousQuestionBtn: UIButton!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var questionTitle: UILabel!
    var question_sort: Int!
    var numberOfQuestion: Int!
    var listQuestion: [CreateExamRequest.Post.QuestionExam] = []
    var examInfo : InformationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        registerCell()
        fixLayout()
        
        questionTitle.text = listQuestion[question_sort - 1].question_title
    }

    func registerCell(){
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        tableView.register(UINib(nibName: "AnswerViewCell", bundle: nil), forCellReuseIdentifier: "AnswerViewCell")
    }

    func fixLayout(){
        updateBtn.layer.cornerRadius = 20
        timeView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        timeView.layer.borderWidth = 2
        timeView.layer.cornerRadius = 12
    }
    
    @IBAction func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapToNextQuestion(_ sender: UIButton){
        if question_sort < numberOfQuestion{
            question_sort += 1
            questionTitle.text = listQuestion[question_sort - 1].question_title
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
    
    @IBAction func tapToPreviousQuestion(_ sender: UIButton){
        if question_sort > 1{
            question_sort -= 1
            questionTitle.text = listQuestion[question_sort - 1].question_title
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
    
    @IBAction func save(){
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ReviewExamViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfQuestion
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.number.text = "\(indexPath.row + 1)"
        cell.id = indexPath.row + 1
        if cell.id == self.question_sort{
            cell.choosen = true
        }else{
            cell.choosen = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        question_sort = indexPath.row + 1
        questionTitle.text = listQuestion[question_sort - 1].question_title
        collectionView.reloadData()
        tableView.reloadData()
    }
}

extension ReviewExamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerViewCell" ) as! AnswerViewCell
        cell.content.text = listQuestion[question_sort - 1].answer_list[indexPath.row]?.content
        return cell
    }
}

extension ReviewExamViewController{
    @IBAction func createExam(){
        let request = CreateExamRequest.Post(question_exam_list: listQuestion , user_id: UserDefaults.standard.integer(forKey: "UserId"), subject_id: (examInfo?.subject_id)!, title: (examInfo?.title)!, time: (examInfo?.time)!, number: (examInfo?.number)!, status: examInfo?.status).route
        print(request)
            APIManager.session.request(request).responseJSON{ json in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                if let data = json.data, let createExamResponse = try? decoder.decode(CreateExamResponse.self, from: data) {
                    print(json)
                    if createExamResponse.statusCode == 200{
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
            
//        }catch {
//            print("Error creating exam: \(error)")
//            // Handle the error case here
//            throw error // rethrow the error to propagate it up the call stack if needed
//        }
    }
}
