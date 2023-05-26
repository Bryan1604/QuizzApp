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
    @IBOutlet weak var questionDescription: UITextField!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var nextAction: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var exam_id: Int?
    var question_id: Int!
    var numberOfQUestion: Int!
    var time: Int!
    
    var question_list: [Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        questionView.layer.cornerRadius = 20
        questionView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        questionView.layer.borderWidth = 2
        nextAction.layer.cornerRadius = 20

        timeView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        timeView.layer.borderWidth = 2
        timeView.layer.cornerRadius = 12
        timeLabel.text = "\(time ?? 0) phút"

        registerCell()
        imageTapped()
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
    
    @IBAction func tapToNextQuestion(_ sender: UIButton){
        if question_id < numberOfQUestion{
            question_id += 1
            collectionView.reloadData()
        }
    }
    @IBAction func tapToPreviousQuestion(_ sender: UIButton){
        if question_id > 1{
            question_id -= 1
            collectionView.reloadData()
        }
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
        if cell.id == self.question_id{
            cell.select = true
        }else{
            cell.select = false
            cell.status = false // dang set tat ca cac cau hoi chua duoc tao
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        question_id = indexPath.row + 1
        collectionView.reloadData()
    }
}

extension CreateExamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputAnswerViewCell") as! InputAnswerViewCell
        cell.id = indexPath.row + 1
        
        return cell
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

struct QuestionModel{
    var question_id: Int?
    var question_title: Int?
    var answer_list: [Answer]?
    struct Answer{
        var answer_id: Int!
        var content: Int?
        var image: String?
        var sort: Int!
        var type: Int!
    }
}
