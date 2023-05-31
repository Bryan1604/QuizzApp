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
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    var avatarImg : UIImage?
    var user_id: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.layer.cornerRadius = 20

        avatar.image = avatarImg
        editAvatar(avatarView)
        
        addGuesture()
        // move image
       
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
    
    func addGuesture(){
        let panGuesture = UIPanGestureRecognizer(target: self, action: #selector(onClickImageView(sender: )))
        panGuesture.minimumNumberOfTouches = 1
        avatar.addGestureRecognizer(panGuesture)
        
        let pinchGuesture = UIPinchGestureRecognizer(target: self, action: #selector(zoomImageView(sender: )))
        avatar.addGestureRecognizer(pinchGuesture)
        
        let rotationGuesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateImageView(sender: )))
        avatar.addGestureRecognizer(rotationGuesture)
    }
    
    func editAvatar(_ sender: UIView){
        let radius: CGFloat = sender.bounds.size.width/2
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: sender.frame.width + 35), cornerRadius: 0)
        let circlePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.width), cornerRadius: radius)
        path.append(circlePath)
        path.usesEvenOddFillRule = true

        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillRule = .evenOdd
        fillLayer.fillColor = view.backgroundColor?.cgColor
        fillLayer.opacity = 0.5
        sender.layer.addSublayer(fillLayer)
    }

    @objc func onClickImageView(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self.avatarView)
        if let view = sender.view{
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

    @objc func zoomImageView(sender: UIPinchGestureRecognizer){
        if sender.state == .changed{
            let scale = sender.scale
            print(scale)
            avatar.frame = CGRect(
                x: 0,
                y: 0,
                width: avatar.frame.width * scale,
                height: avatar.frame.height * scale)
        }
    }
    
    @objc func rotateImageView(sender: UIRotationGestureRecognizer){
        var lastRotation: CGFloat = 0
        var BeginRotation = CGFloat()
        if sender.state == .began{
            print("rotation begin")
            sender.rotation = lastRotation
            BeginRotation = sender.rotation
        }else if sender.state == .changed{
            print("rotation changing")
            let newRotation = sender.rotation + BeginRotation
            sender.view?.transform = CGAffineTransform(rotationAngle: newRotation) // view??
        }else if sender.state == .ended{
            print("rotation cancelled")
            lastRotation = sender.rotation
        }
    }
}
