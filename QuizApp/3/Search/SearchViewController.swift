//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/16/23.
//

import UIKit

class SearchViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    var data = GetDepartmentListResponse( result: [GetDepartmentListResponse.Result]())

    var keyword : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        searchCollectionView?.delegate = self
        searchCollectionView?.dataSource = self
        registerHeader()
        registerNib()
        searchAction()
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
        data.result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell",for: indexPath) as! ItemCollectionViewCell
        cell.thumnail.image = UIImage(named: data.result[indexPath.row].image!)
        cell.title.text = data.result[indexPath.row].title
        cell.count.text = String(indexPath.row)
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
        header.delegate = self
        keyword = header.textInput.text
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
    func getDepartmentList(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: self.keyword).route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getDepartmentListResponse = try? decoder.decode(GetDepartmentListResponse.self, from: data) {
                self.data.result = getDepartmentListResponse.result
                DispatchQueue.main.async {
                    self.searchCollectionView.reloadData()
                }
                }
            }
        }
}

extension SearchViewController: SearchDelegate{
    func searchAction() {
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: self.keyword).route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            print(json)
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getDepartmentListResponse = try? decoder.decode(GetDepartmentListResponse.self, from: data) {
                self.data.result = getDepartmentListResponse.result
                DispatchQueue.main.async {
                    self.searchCollectionView.reloadData()
                }
            }
        }
    }
}
