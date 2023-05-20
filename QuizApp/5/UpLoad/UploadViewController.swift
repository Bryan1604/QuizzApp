//
//  UploadViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 02/03/2023.
//


import UIKit
import VerticalSlidingPresentationController
import KUIPopOver
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

    @IBOutlet weak var createbtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    @IBOutlet weak var titleExam: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var mode: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var numberOfQuestion: UITextField!
    @IBOutlet weak var descriptionExam: UITextField!
    
    @IBOutlet weak var actionMenuBtn: UIButton!
    @IBOutlet weak var setModeBtn: UIButton!
    @IBOutlet weak var setDepartmentBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        layoutView(view: view1)
        layoutView(view: view2)
        layoutView(view: view3)
        layoutView(view: view4)
        layoutView(view: view5)
        layoutView(view: view6)
        
        layoutButton(sheetUploadBtn)
        layoutButton(excelUploadBtn)
        layoutButton(shareBtn)

        handMadeUploadBtn.layer.cornerRadius = 20
        createbtn.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 20
        imageTapped()
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

//        
//        myViewController.modalPresentationStyle = .popover
//        //var Popover = vc.popoverPresentationController
//        if let Popover = myViewController.popoverPresentationController {
//            Popover.sourceView = self.view
//            Popover.sourceRect = CGRectMake(self.view.center.x,self.view.center.y+180,0,0)
//            myViewController.preferredContentSize = CGSizeMake(300,360)
//            Popover.delegate = self
//        }
        
        if let presentationController = myViewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()] /// change to [.medium(), .large()] for a half *and* full screen sheet
//            presentationController.sourceView?.layer.cornerRadius = 50
//            presentationController.sourceView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
                }
        self.present(myViewController, animated: true)
    }
    
    @IBAction func createExam(){
        let vc = UIStoryboard(name: "CreateExamViewController", bundle: nil).instantiateViewController(withIdentifier: "CreateExamViewController") as! CreateExamViewController
        vc.question_id = 1
        vc.numberOfQUestion = Int(numberOfQuestion.text ?? "")
        vc.timeLabel?.text = (time.text ?? "") + "phút"
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
        }
        let menu = UIMenu( children : [
            UIAction(title: "Tự nhiên", state: .off, handler: optionClosure),
            UIAction(title: "Xã hội", state: .off, handler: optionClosure)
        ])
        setDepartmentBtn.menu = menu
        setDepartmentBtn.showsMenuAsPrimaryAction = true
        setDepartmentBtn.changesSelectionAsPrimaryAction = false
    }
}
