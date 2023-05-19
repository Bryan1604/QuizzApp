//
//  ProfileViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//

import UIKit
import SwiftUICharts
import MBCircularProgressBar
import Alamofire
import SDWebImage
class ProfileViewController: UIViewController{

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var filterbtn: UIButton!
    @IBOutlet weak var roundChart : MBCircularProgressBarView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var user_id: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
        filterbtn.layer.cornerRadius = 10
        
        avatar.layer.masksToBounds = false
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.clipsToBounds = true
        
        roundChart.value = 0
        UIView.animate(withDuration: 2.0, delay: 0.5, options: [.curveEaseIn], animations: {
            self.roundChart.value = 60 // Set the target value of progress bar
        }, completion: nil)
        
    }

    @IBAction func setUpAction(_ sender: Any) {
        let vc = UIStoryboard(name: "SetUpViewController", bundle: nil).instantiateViewController(withIdentifier: "SetUpViewController") as! SetUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getUserInfo(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetUserInfoRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
                self.name.text = getUserInfoResponse.result?.name
                self.user_id = getUserInfoResponse.result?.id
                if getUserInfoResponse.result?.avatar == "" {
                    self.avatar.image = UIImage(named: "avatar")
                }else{
                    self.avatar.sd_setImage(with: URL(string: (getUserInfoResponse.result?.avatar)!))
                }
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getUserInfo()
    }
    
}
