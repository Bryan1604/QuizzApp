//
//  CreateExamViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import UIKit

class CreateExamViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionTitle: UITextField!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLevel: UIButton!
    
    var exam_id: Int?
    var question_sort: Int!
    var numberOfQUestion: Int!  //number
    var time: Int!
    var subject_id: Int!
    var titleExam: String!
    var status: Int!
    //var listQuestion = [QuestionModel](repeating: QuestionModel(), count: 10)
    var listQuestion : [CreateExamRequest.Post.QuestionExam] = []
    var listAnswer = (0..<4).map { _ in CreateExamRequest.Post.QuestionExam.AnswerList(content: "", type: 0, sort: 0, image_url: "", image: "") }

    //var listQuestion : [QuestionModel] = []
    //var listAnswer = [QuestionModel.Answer](repeating: QuestionModel.Answer(), count: 4)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        questionView.layer.cornerRadius = 20
        questionView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        questionView.layer.borderWidth = 2
        doneBtn.layer.cornerRadius = 20

        timeView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        timeView.layer.borderWidth = 2
        timeView.layer.cornerRadius = 12
        timeLabel.text = "\(time ?? 0) phút"

        questionLevel.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        questionLevel.layer.borderWidth = 2
        questionLevel.layer.cornerRadius = 12
        if self.questionLevel.title(for: .normal) == "Dễ"{
            self.listQuestion[self.question_sort - 1].question_level = 1
        }else if self.questionLevel.title(for: .normal) == "Trung bình"{
            self.listQuestion[self.question_sort - 1].question_level = 2
        }else{
            self.listQuestion[self.question_sort - 1].question_level = 3
        }
        
        registerCell()
        imageTapped()
        
        doneBtn.isHidden = true
    }
    
    func registerCell(){
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        tableView.register(UINib(nibName: "InputAnswerViewCell", bundle: nil), forCellReuseIdentifier: "InputAnswerViewCell")
    }
    
    @IBAction func backAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func imageTapped(){
        imageView.isUserInteractionEnabled = true
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(getImage(_ :)))
        imageView.addGestureRecognizer(tapGuesture)
    }
    
    @objc func getImage( _ sender: UITapGestureRecognizer){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func setQuestionLevel(){
        let optionClosure : (UIAction) -> Void = { action in
            self.questionLevel.setTitle(action.title, for: .normal)
            if self.questionLevel.title(for: .normal) == "Dễ"{
                self.listQuestion[self.question_sort - 1].question_level = 1
            }else if self.questionLevel.title(for: .normal) == "Trung bình"{
                self.listQuestion[self.question_sort - 1].question_level = 2
            }else{
                self.listQuestion[self.question_sort - 1].question_level = 3
            }
        }
        let menu = UIMenu( children : [
            UIAction(title: "Dễ", state: .off, handler: optionClosure),
            UIAction(title: "Trung bình", state: .off, handler: optionClosure),
            UIAction(title: "Khó", state: .off, handler: optionClosure)
        ])
        questionLevel.menu = menu
        questionLevel.showsMenuAsPrimaryAction = true
        questionLevel.changesSelectionAsPrimaryAction = false
    }
    
    @IBAction func tapToNextQuestion(_ sender: UIButton){
        addQuestion()
        print(listQuestion)
        if question_sort < numberOfQUestion{
            question_sort += 1
            if question_sort == numberOfQUestion{
                doneBtn.isHidden = false
            }
            collectionView.reloadData()
        }
    }
    
    @IBAction func tapToPreviousQuestion(_ sender: UIButton){
        if question_sort > 1{
            question_sort -= 1
            doneBtn.isHidden = true
            collectionView.reloadData()
        }
    }
    
    func addQuestion(){
        listQuestion[question_sort-1].question_sort = self.question_sort
        listQuestion[question_sort-1].answer_list = self.listAnswer
        listQuestion[question_sort-1].question_title = self.questionTitle.text ?? ""
        listQuestion[question_sort-1].question_sort = self.question_sort
    }
    
    
    @IBAction func reviewAction(){
        // create exam information
        let examInfo = InformationModel(user_id: UserDefaults.standard.integer(forKey: "UserId"), subject_id: self.subject_id, title: self.titleExam, time: self.time, number: self.numberOfQUestion, status: self.status)
        // create list question
        addQuestion()
        let vc = UIStoryboard(name: "ReviewExamViewController", bundle: nil).instantiateViewController(withIdentifier: "ReviewExamViewController") as! ReviewExamViewController
        vc.question_sort = 1
        vc.numberOfQuestion = numberOfQUestion
        vc.examInfo = examInfo
        vc.listQuestion = listQuestion
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CreateExamViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfQUestion ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.number.text = "\(indexPath.row + 1)"
        cell.id = indexPath.row + 1
        if cell.id == self.question_sort{
            cell.select = true
        }else{
            cell.select = false
            cell.status = false // dang set tat ca cac cau hoi chua duoc tao
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        question_sort = indexPath.row + 1
        if question_sort == numberOfQUestion{
            doneBtn.isHidden = false
        }else{
            doneBtn.isHidden = true
        }
        collectionView.reloadData()
    }
}

extension CreateExamViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, CustomCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputAnswerViewCell", for: indexPath) as! InputAnswerViewCell
        
        cell.textAnswer?.tag = indexPath.row
        cell.textAnswer?.delegate = self
        cell.id = indexPath.row + 1
        cell.textAnswer?.text = ""
        cell.delegate = self
        cell.configure(with: indexPath)
        
        listAnswer[indexPath.row].image = ""  // chua can upload anh
        listAnswer[indexPath.row].sort = indexPath.row + 1
        listAnswer[indexPath.row].type = 0
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let row = textField.tag
        listAnswer[row].content = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          if let text = textField.text, let textRange = Range(range, in: text) {
              let updatedText = text.replacingCharacters(in: textRange, with: string)
              let row = textField.tag
              listAnswer[row].content = updatedText
          }
          return true
      }
    
    func buttonTapped(at indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! InputAnswerViewCell
        listAnswer[indexPath.row].type = cell.type
    }
}


extension CreateExamViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            //avatar.image = image
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
