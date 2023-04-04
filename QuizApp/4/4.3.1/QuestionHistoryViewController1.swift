//
//  QuestionHistoryViewController1.swift
//  QuizApp
//
//  Created by Luong Vu on 3/31/23.
//

import UIKit

class QuestionHistoryViewController1: UIViewController  {

    @IBOutlet weak var questionCollection: UICollectionView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var levelBtn: UIButton!
    
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var doneBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionCollection?.delegate = self
        questionCollection?.dataSource = self
        // Do any additional setup after loading the view.
        layout(view1)
        layout(view2)
        layout(view3)
        layout(view4)
        
        timeView.layer.cornerRadius = 15
        timeView.layer.borderColor = UIColor.systemGray5.cgColor
        timeView.layer.borderWidth = 2
        
        levelBtn.layer.cornerRadius = 15
        levelBtn.layer.borderColor = UIColor.systemGray5.cgColor
        levelBtn.layer.borderWidth = 2
        doneBtn.layer.cornerRadius = 20
        image.layer.cornerRadius = 20
        
        registerNib()
    }
    
    func registerNib(){
        questionCollection?.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil),
                                       forCellWithReuseIdentifier: "QuestionCollectionViewCell")
    }
    
    func layout(_ view1 : AnyObject){
        view1.layer.cornerRadius = 20
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        view1.layer.borderWidth = 2
    }
    
    @IBAction func backAction(){
        self.navigationController?.popViewController(animated: true)
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

extension QuestionHistoryViewController1: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell",for: indexPath) as! QuestionCollectionViewCell
        cell.question.text = "\(indexPath.row)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.contentView.backgroundColor = .black
    }
    
}
