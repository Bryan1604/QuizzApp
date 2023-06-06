//
//  UploadSheetViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit
import Alamofire

class UploadSheetViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var inputLink: UITextField!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var backBtn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView()
        self.navigationController?.isNavigationBarHidden = true
    }
    

    func layoutView(){
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        view1.layer.cornerRadius = 20
        checkBtn.layer.cornerRadius = 20
        backBtn2.layer.cornerRadius = 20
        
        
        popupView.layer.cornerRadius = 20
        blurView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.8, height: 218)
    }
    
    @IBAction func checkAction(_ sender: Any) {
        var headers: HTTPHeaders{
            var headers = HTTPHeaders()
            headers["Authorization"] = UserDefaults.standard.string(forKey: "AccessToken")
            return headers
        }
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        AF.upload(multipartFormData: { multipartFormData in
            if let userData = String(user_id).data(using: .utf8){
                multipartFormData.append(userData, withName: "user_id")
            }
            if let google_sheet_url = (self.inputLink.text)?.data(using: .utf8) {
                multipartFormData.append(google_sheet_url, withName: "google_sheet_url")
            }
        },to: "https://asia-northeast1-quiz-app-traning.cloudfunctions.net/postGoogleSheet",
                  method: .post,
                  headers: headers
        ).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let postGoogleSheetResponse = try? decoder.decode(PostGoogleSheetResponse.self, from: data) {
                if postGoogleSheetResponse.statusCode == 200{
                    self.animateIn(designedView: self.blurView)
                    self.animateIn(designedView: self.popupView)
                }
            }
        }
    }
        
        
//        let user_id = UserDefaults.standard.integer(forKey: "UserId")
//        let google_sheet_url = inputLink.text
//        let request = PostGoogleSheetRequest.Post(user_id: user_id, google_sheet_url: google_sheet_url ?? "").route
//        APIManager.session.request(request).responseJSON{ json in
//            print(json)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .useDefaultKeys
//            if let data = json.data, let postGoogleSheetResponse = try? decoder.decode(PostGoogleSheetResponse.self, from: data) {
//                if postGoogleSheetResponse.statusCode == 200{
//                    self.animateIn(designedView: self.blurView)
//                    self.animateIn(designedView: self.popupView)
//                }
//            }
//        }
//    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backAction2(_ sender: Any) { // back from popup view
        animateOut(desiredView: popupView)
        animateOut(desiredView: blurView)
    }
    
    func animateIn(designedView: UIView){
        let backgroundView = self.view
        backgroundView?.addSubview(designedView)
        designedView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        designedView.alpha = 0
        designedView.center = backgroundView!.center
        UIView.animate(withDuration: 0.3,  animations: {
            designedView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            designedView.alpha = 2
        })
    }
    
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
}

extension UploadSheetViewController{
//    @IBAction func uploadGoogleSheet(){
//        let user_id = UserDefaults.standard.integer(forKey: "UserId")
//        let google_sheet_url = inputLink.text
//        let request = ListDepartmentInfoRequest.Post(user_id: user_id).route
//        APIManager.session.request(request).responseJSON{ json in
//            print(json)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .useDefaultKeys
//            if let data = json.data, let listDepartmentInfoResponse = try? decoder.decode(ListDepartmentInfoResponse.self, from: data) {
//
//            }
//        }
//    }
}
