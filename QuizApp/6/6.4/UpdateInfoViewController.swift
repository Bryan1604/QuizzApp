//
//  UpdateInfoViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit

class UpdateInfoViewController: UIViewController{
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var resetBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 20
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        view2.layer.cornerRadius = 20
        view2.layer.borderWidth = 2
        view2.layer.borderColor = UIColor.systemGray5.cgColor
        resetBtn.layer.cornerRadius = 20
        
        avatar.layer.masksToBounds = false
        avatar.layer.cornerRadius = avatar.frame.height/2
        avatar.clipsToBounds = true
        
        imageTapped()
    }
    override func viewWillAppear(_ animated: Bool) {
        getUserInfo()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateInfo(_ sender: Any){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = UpdateUserInfoRequest.Post(user_id: user_id, name: name.text!, birthday: birthday.text! ).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let updateUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
                if updateUserInfoResponse.statusCode == 200{
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func imageTapped(){
        avatar.isUserInteractionEnabled = true
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(getAvatar(_ :)))
        avatar.addGestureRecognizer(tapGuesture)
    }
    
    @objc func getAvatar( _ sender: UITapGestureRecognizer){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func getUserInfo(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetUserInfoRequest.Post(user_id:user_id).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getUserInfoResponse = try? decoder.decode(GetUserInfoResponse.self, from: data) {
                    self.avatar.sd_setImage(with: URL(string: (getUserInfoResponse.result?.avatar)!))
            }
        }
    }
}

extension UpdateInfoViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
//            avatar.image = image
            let vc = UIStoryboard(name: "UpdateAvatarViewController", bundle: nil).instantiateViewController(withIdentifier: "UpdateAvatarViewController") as! UpdateAvatarViewController
            vc.avatarImg = image
            vc.user_id  = UserDefaults.standard.integer(forKey: "UserId")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
