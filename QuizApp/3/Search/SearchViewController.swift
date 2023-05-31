//
//  SearchViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 3/16/23.
//

import UIKit
import SDWebImage
import SwiftOverlays
class SearchViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    var data = GetDepartmentListResponse( result: [GetDepartmentListResponse.Result]())
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layer.backgroundColor = .init(red: 12, green: 9, blue: 42, alpha: 0.2)
        searchView.layer.cornerRadius = 20
        
        searchCollectionView?.delegate = self
        searchCollectionView?.dataSource = self
        searchCollectionView?.layer.cornerRadius = 20
        searchCollectionView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        layoutCollectionView()
        registerHeader()
        registerNib()
        
        searchAction2()
       // searchAction()
        
       
    }
    func layoutCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 132)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        searchCollectionView.collectionViewLayout = layout
    }
    
    func registerNib(){
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
        
        cell.id = data.result[indexPath.row].id
        cell.thumnail.sd_setImage(with: URL(string: data.result[indexPath.row].image ?? ""))
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
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ItemCollectionViewCell
        let storyboard = UIStoryboard(name: "SearchSubjectViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchSubjectViewController") as? SearchSubjectViewController
        
        vc?.department_id = cell.id // Set the department ID based on the selected cell
        vc?.keyword = "" // Set the desired keyword
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension SearchViewController: SearchDelegate{
    func searchAction() {
        //
    }
    
    func searchAction2(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let keyword = textInput.text
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: keyword).route
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
    
    @IBAction func searchBtnTapped(_ sender: UIButton){
        searchAction2()
    }
    
    @IBAction func backAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "TabBarViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
        SceneDelegate.shared?.changeRootController(vc)
    }
}
