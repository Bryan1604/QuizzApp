//
//  HomeHeaderTableViewCell.swift
//  QuizApp
//
//  Created by Nghĩa Nguyễn on 3/13/23.
//

import UIKit
//protocol HomeHeaderTableViewCellDelegate: AnyObject{
//    // tap button d lay danh sach de cua nguoi dung hay he thong
//    func didTapButton()
//}

class HomeHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var avatar: UIImageView?
    @IBOutlet weak var findID: UIButton?
    @IBOutlet weak var childView: UIView?
    @IBOutlet weak var headerList: UIView?
    
    @IBOutlet weak var systemBtn: UIButton?
    @IBOutlet weak var userBtn: UIButton?
    
    @IBOutlet weak var highlineView1: UIView!
    @IBOutlet weak var highlineView2: UIView!
    //weak var delegate: HomeHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        childView?.layer.cornerRadius = 20
        childView?.backgroundColor = .white.withAlphaComponent(0.2)
        findID?.layer.cornerRadius = 20

        headerList?.layer.cornerRadius = 20
        headerList?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        avatar?.layer.masksToBounds = false
        avatar?.layer.cornerRadius = (avatar?.frame.height)!/2
        avatar?.clipsToBounds = true
        
//        let bottomBorder = CALayer()
//        bottomBorder.backgroundColor = UIColor.black.cgColor
//        bottomBorder.frame = CGRect(x: 0, y: (systemBtn?.frame.height ?? 0) - 1, width: systemBtn?.frame.width ?? 0, height: 1)
//        systemBtn?.layer.addSublayer(bottomBorder)
//
//        let bottomBorder2 = CALayer()
//        bottomBorder2.backgroundColor = UIColor.black.cgColor
//        bottomBorder2.frame = CGRect(x: 0, y: (userBtn?.frame.height ?? 0) - 1, width: systemBtn?.frame.width ?? 0 , height: 1)
//        userBtn?.layer.addSublayer(bottomBorder2)
        
        if UserDefaults.standard.integer(forKey: "Type") == 0{
            systemBtn?.layer.opacity = 1
            highlineView1.layer.opacity = 1
            userBtn?.layer.opacity = 0.3
            highlineView2.layer.opacity = 0.3

        }else{
            systemBtn?.layer.opacity = 0.3
            highlineView1.layer.opacity = 0.3
            userBtn?.layer.opacity = 1
            highlineView2.layer.opacity = 1

        }
    }
    
    
    @IBAction func tapButton(_ sender : UIButton) {
        switch sender.tag{
        case 0:
            UserDefaults.standard.setValue(0, forKey: "Type")
        default:
            UserDefaults.standard.setValue(1, forKey: "Type")
        }
        if UserDefaults.standard.integer(forKey: "Type") == 0{
            systemBtn?.layer.opacity = 1
            highlineView1.layer.opacity = 1
            userBtn?.layer.opacity = 0.3
            highlineView2.layer.opacity = 0.3
        }else{
            systemBtn?.layer.opacity = 0.3
            highlineView1.layer.opacity = 0.3
            userBtn?.layer.opacity = 1
            highlineView2.layer.opacity = 1
        }
    }
    
//    func getUserInfo(){
//        let user_id = UserDefaults.standard.integer(forKey: "UserId")
//        let request = GetUserInfoRequest.Post(user_id: user_id).route
//        APIManager.session.request(request).responseJSON { json in
//            print(json)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .useDefaultKeys
//            if let data = json.data, let getUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
//                self.name?.text = getUserInfoResponse.result?.name
//                self.avatar?.sd_setImage(with: URL(string: (getUserInfoResponse.result?.avatar)!))
//            }
//        }
//    }
    
}
