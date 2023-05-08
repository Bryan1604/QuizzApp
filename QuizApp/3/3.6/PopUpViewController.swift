//
//  PopUpViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/27/23.
//

import UIKit
import KUIPopOver
class PopUpViewController: UIViewController{
    @IBOutlet weak var questionCollection: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionCollection?.dataSource = self
        self.questionCollection?.delegate = self
        questionCollection?.register(UINib(nibName: "QuestionCollectionCell",bundle: nil),
                                        forCellWithReuseIdentifier: "QuestionCollectionCell")
       // self.preferredContentSize = CGSize(width: 300, height: 400)
        questionCollection?.layer.cornerRadius = 20
        questionCollection?.backgroundColor = .red
    }
    
    
}

extension PopUpViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionCell", for: indexPath) as! QuestionCollectionCell
        cell.numberOfQuestion?.text = "\(indexPath.row)"
        // chage color and status when question be answered
        //....
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
