//
//  UploadViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//


import UIKit
import VerticalSlidingPresentationController
import KUIPopOver
import Alamofire
class UploadViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sheetUploadBtn: UIButton!
    @IBOutlet weak var excelUploadBtn: UIButton!
    @IBOutlet weak var handMadeUploadBtn: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    
    @IBOutlet weak var createbtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var titleExam: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var mode: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var numberOfQuestion: UITextField!
    @IBOutlet weak var descriptionExam: UITextField!
    
    @IBOutlet weak var actionMenuBtn: UIButton!
    @IBOutlet weak var setModeBtn: UIButton!
    @IBOutlet weak var setDepartmentBtn: UIButton!
    @IBOutlet weak var setSubjectBtn: UIButton!
    
    var departmentList : [GetDepartmentListResponse.Result]?
    var subjectList: [ListDepartmentInfoResponse.Result.Subject]?
    
    var departmentId: Int?
    var subjectId: Int?
    
    var departments : [String: Int?] = [:]
    var subjects: [String: Int?] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView(view: view1)
        layoutView(view: view2)
        layoutView(view: view3)
        layoutView(view: view4)
        layoutView(view: view5)
        layoutView(view: view6)
        layoutView(view: view7)
        layoutButton(sheetUploadBtn)
        layoutButton(excelUploadBtn)
        layoutButton(shareBtn)

        handMadeUploadBtn.layer.cornerRadius = 20
        createbtn.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 20
        imageTapped()
        getDepartmentList()
        getListSubject()
    }
   
    func layoutView(view: UIView){
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
    }

    func layoutButton(_ button: UIButton){
        button.layer.cornerRadius=20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
    }
    
    @IBAction func upLoadFromSheet(_ sender: Any) {
        let vc = UIStoryboard(name: "UploadSheetViewController", bundle: nil).instantiateViewController(withIdentifier: "UploadSheetViewController") as! UploadSheetViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func shareAction(){
        let myViewController = UIStoryboard(name: "SharePopUpViewController", bundle: nil).instantiateViewController(withIdentifier: "SharePopUpViewController")
        if let presentationController = myViewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
                }
        self.present(myViewController, animated: true)
    }
    
    @IBAction func createExam(){
        let vc = UIStoryboard(name: "CreateExamViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateExamViewController") as! CreateExamViewController
        let numberOfQuestion = Int(numberOfQuestion.text ?? "")
        vc.question_id = 1
        vc.numberOfQUestion = numberOfQuestion
        vc.time = Int(time.text ?? "0")
        if mode.text == "Công khai"{
            vc.status = 1
        }else{
            vc.status = 2
        }
        vc.titleExam = titleExam.text
        vc.subject_id = subjects[subject.text ?? ""] as? Int
        vc.listQuestion = [QuestionModel](repeating: QuestionModel(), count: numberOfQuestion ?? 0)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func imageTapped(){
        imageView.isUserInteractionEnabled = true
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(getImage(_ :)))
        imageView.addGestureRecognizer(tapGuesture)
    }
    
    @objc func getImage( _ sender: UITapGestureRecognizer){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension UploadViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


extension UploadViewController {
    
    @IBAction func setPopupButton(){
        let optionClosure : (UIAction) -> Void = { action in
            // do action
        }
        let menu = UIMenu( children : [
            UIAction(title: "Quản lí", state: .off, handler: optionClosure),
            UIAction(title: "Lịch sử", state: .off, handler: optionClosure),
            UIAction(title: "Xóa bỏ", state: .off, handler: optionClosure)
        ])
        actionMenuBtn.menu = menu
        actionMenuBtn.showsMenuAsPrimaryAction = true
        actionMenuBtn.changesSelectionAsPrimaryAction = false
    }
    
    @IBAction func setMode(){
        let optionClosure : (UIAction) -> Void = { action in
            self.mode.text = action.title
        }
        let menu = UIMenu( children : [
            UIAction(title: "Công khai", state: .off, handler: optionClosure),
            UIAction(title: "Riêng tư", state: .off, handler: optionClosure)
        ])
        setModeBtn.menu = menu
        setModeBtn.showsMenuAsPrimaryAction = true
        setModeBtn.changesSelectionAsPrimaryAction = false
    }
    
    @IBAction func setDepartment(){
        let optionClosure : (UIAction) -> Void = { action in
            self.department.text = action.title
            self.departmentId = self.departments[action.title] as? Int
        }
        var actions: [UIAction] = []
        for d in departmentList! {
            actions.append(UIAction(title: d.title ?? "", state: .off, handler: optionClosure))
            departments[d.title!] = d.id
        }
        let menu = UIMenu( children : actions)
        
        setDepartmentBtn.menu = menu
        setDepartmentBtn.showsMenuAsPrimaryAction = true
        setDepartmentBtn.changesSelectionAsPrimaryAction = false
    }
    
    @IBAction func setSubject(){
        let optionClosure : (UIAction) -> Void = { action in
            self.subject.text = action.title
            self.subjectId = self.departments[action.title] as? Int
        }
        var actions: [UIAction] = []
        for s in subjectList!{
            actions.append(UIAction(title: s.title ?? "", state: .off, handler: optionClosure))
            subjects[s.title!] = s.id
        }
        let menu = UIMenu( children : actions)
        setSubjectBtn.menu = menu
        setSubjectBtn.showsMenuAsPrimaryAction = true
        setSubjectBtn.changesSelectionAsPrimaryAction = false
    }
    
    @IBAction func postImageExam(_ sender: UIButton){
        var headers: HTTPHeaders{
            var headers = HTTPHeaders()
            headers["Authorization"] = UserDefaults.standard.string(forKey: "AccessToken")
            return headers
        }
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let folder_name = "exam"
        let filename = ""
        AF.upload(multipartFormData: { multipartFormData in
            if let userData = String(user_id).data(using: .utf8){
                multipartFormData.append(userData, withName: "user_id")
            }
            if let imageData = self.imageView.image?.jpegData(compressionQuality: 0.8){
                multipartFormData.append(imageData, withName: "file",fileName: "exam\(self.subjectId ?? 0).jpeg",mimeType: "image/jpeg")
            }
            if let folderNameData = String(folder_name).data(using: .utf8){
                multipartFormData.append(folderNameData, withName: "folder_name")
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
}

extension UploadViewController{

    func getDepartmentList(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = GetDepartmentListRequest.Post(user_id: user_id, keyword: "").route
        APIManager.session.request(request).responseJSON{ json in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let getDepartmentListResponse = try? decoder.decode(GetDepartmentListResponse.self, from: data) {
                self.departmentList = getDepartmentListResponse.result
                }
            }
        }
    
    func getListSubject(){
        let user_id = UserDefaults.standard.integer(forKey: "UserId")
        let request = ListDepartmentInfoRequest.Post(user_id: user_id).route
        APIManager.session.request(request).responseJSON{ json in
            print(json)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            if let data = json.data, let listDepartmentInfoResponse = try? decoder.decode(ListDepartmentInfoResponse.self, from: data) {
                self.subjectList = listDepartmentInfoResponse.result[self.departmentId ?? 0].subjects
            }
        }
    }
}
