//
//  UpdateAvatarViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/24/23.
//

import UIKit
import Alamofire
class UpdateAvatarViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    var avatarImg : UIImage?
    var user_id: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.layer.cornerRadius = 20
       
   
        avatar.image = avatarImg
        avatar.layer.masksToBounds = false
        avatar.layer.cornerRadius = (avatar.frame.height)/2
        avatar.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func finishEditAvatar(_ sender: UIButton){
        var headers: HTTPHeaders{
            var headers = HTTPHeaders()
            headers["Authorization"] = UserDefaults.standard.string(forKey: "AccessToken")
            return headers
        }
        AF.upload(multipartFormData: { multipartFormData in
            if let userData = String(self.user_id).data(using: .utf8){
                multipartFormData.append(userData, withName: "user_id")
            }
            if let imageData = self.avatarImg?.jpegData(compressionQuality: 0.8){
                multipartFormData.append(imageData, withName: "file",fileName: "avatar.jpeg",mimeType: "image/jpeg")
            }
        },to: "https://asia-northeast1-quiz-app-traning.cloudfunctions.net/editAvatar",
                  method: .post,
                  headers: headers
        ).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
                if getUserInfoResponse.statusCode == 200{
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
 
    
    /*
    @IBAction func updateAvatar(_ sender: UIButton) {
        // Convert to PNG format
        if let pngData = self.avatar?.image?.pngData(),
           let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("myImage.png")
            do {
                try pngData.write(to: fileURL, options: .atomic)
                
                let user_id = UserDefaults.standard.integer(forKey: "UserId")
                //let request = EditAvatarRequest.Post(user_id: user_id, file: fileURL).route
                APIManager.session.upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(fileURL, withName: "avatar", fileName: "myImage.png", mimeType: "image/png")
                }, with: request, encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { json in
                            print(json)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            if let data = json.data, let editAvatarResponse = try? decoder.decode(UpdateUserInfoResponse.self, from: data) {
                                if editAvatarResponse.statusCode == 200 {
                                    self.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                    case .failure(let encodingError):
                        print(encodingError)
                    }
                })
            } catch {
                print(error)
            }
        }
    }
     */


}
