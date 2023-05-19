//
//  UpdateEmailViewController.swift
//  QuizApp
//
//  Created by Luong Vu on 4/3/23.
//

import UIKit

class UpdateEmailViewController: UIViewController {

    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 20
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.systemGray5.cgColor
        resetBtn.layer.cornerRadius = 20
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeEmail(_ sender: Any){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let email = email.text
        let request = ChangeEmailRequest.Post(user_id: user_id, email: email! ).route
        APIManager.session.request(request).responseJSON { json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let changeEmailResponse = try? decoder.decode(UpdateUserInfoResponse.self, from: data) {
                if changeEmailResponse.statusCode == 200{
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
