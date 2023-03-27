//
//  PopUpViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/27/23.
//

import UIKit

class PopUpViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
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
    

    @IBOutlet weak var questionCollection: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.questionCollection?.dataSource = self
        self.questionCollection?.delegate = self
        questionCollection?.register(UINib(nibName: "QuestionCollectionCell",bundle: nil),
                                        forCellWithReuseIdentifier: "QuestionCollectionCell")
    }
}
