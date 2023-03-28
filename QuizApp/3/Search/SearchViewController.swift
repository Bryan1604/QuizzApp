//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/16/23.
//

import UIKit

class SearchViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var data = [
        item(thumnail: "Icon0", title: "Toán", count: "21 Câu đố",coler: "red"),
        item(thumnail: "Icon1", title: "Khoa học", count: "21 Câu đố",coler: "blue"),
        item(thumnail: "Icon2", title: "Nhạc", count: "21 Câu đố",coler: "yellow"),
        item(thumnail: "Icon3", title: "Thể thao", count: "21 Câu đố",coler: "Black"),
        item(thumnail: "Icon4", title: "Công nghệ", count: "21 Câu đố",coler: "red"),
        item(thumnail: "Icon5", title: "Du lịch", count: "21 Câu đố",coler: "pink")
    ]
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchCollectionView?.delegate = self
        searchCollectionView?.dataSource = self
        
        registerHeader()
        registerNib()
    }
    
    func registerNib(){
        print("register here")
        searchCollectionView?.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil),
                                       forCellWithReuseIdentifier: "ItemCollectionViewCell")
    }
    
    func registerHeader(){
        searchCollectionView?.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil),
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: "HeaderCollectionReusableView")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell",for: indexPath) as! ItemCollectionViewCell
        cell.thumnail.image = UIImage(named: data[indexPath.row].thumnail)
        cell.title.text = data[indexPath.row].title
        cell.count.text = data[indexPath.row].count
        let row = indexPath.row
        if ((row % 6) == 0){
            cell.itemView.backgroundColor = .systemGray5
        } else if ((row % 6) == 1){
            cell.itemView.backgroundColor = .systemPink
        }else if ((row % 6) == 2){
            cell.itemView.backgroundColor = .systemBlue
        }else if ((row % 6) == 3){
            cell.itemView.backgroundColor = .systemGreen
        }else if ((row % 6) == 4){
            cell.itemView.backgroundColor = .systemGray5
        } else {
            cell.itemView.backgroundColor = .systemCyan
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: "HeaderCollectionReusableView",
                                                                     for: indexPath) as! HeaderCollectionReusableView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Get the view for the first header
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView,
                                             viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
                                             at: indexPath)

        // Use this view to calculate the optimal size based on the collection view's width
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width, height: 190 ))
                                                            //collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height))
//                                                  ,
//                                                  withHorizontalFittingPriority: .required, // Width is fixed
//                                                  verticalFittingPriority: .fittingSizeLevel) // Height can be as large as needed
    }
  

}
