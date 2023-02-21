//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton?
    @IBOutlet weak var signInLabel: UILabel?
    @IBOutlet weak var lblTermsAndCondition: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonProperty(button: signUpBtn!)
        clickLabel(label: signInLabel!)
        setLabel()
    }
}

extension SignUpViewController{
    func setButtonProperty( button: UIButton){
        button.layer.cornerRadius = 20
    }
    // tap to sign in label
    func clickLabel(label : UILabel){
        label.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self,
                                                        action: #selector(signInLabelClicked(_:)))
        label.addGestureRecognizer(guestureRecognizer)
    }
    
    func setLabel(){
        var textArray = [String]()
        var fontArray = [UIFont]()
        
        textArray.append("Bằng cách nhấp vào đăng kí, bạn đồng ý với ")
        textArray.append("Điều khoản ")
        textArray.append("và ")
        textArray.append("Điều kiện sử dụng ")
        textArray.append("của chúng tôi")
        
        fontArray.append(UIFont(name: "SVN-Gilroy", size: 14)!)
        fontArray.append(UIFont(name: "SVN-Gilroy Bold", size: 14)!)
        fontArray.append(UIFont(name: "SVN-Gilroy", size: 14)!)
        fontArray.append(UIFont(name: "SVN-Gilroy Bold", size: 14)!)
        fontArray.append(UIFont(name: "SVN-Gilroy", size: 14)!)
        
        lblTermsAndCondition?.attributedText = getAttributedString(arrayText: textArray,
                                                                   arrayFonts: fontArray)
        
        lblTermsAndCondition?.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self,
                                                action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        lblTermsAndCondition?.addGestureRecognizer(tapgesture)
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer){
        guard let text = self.lblTermsAndCondition?.text else{return}
        let conditionRange = (text as NSString).range(of: "Điều khoản")
        let cancellationRange = (text as NSString).range(of: "Điều kiện sử dụng")
        
        if gesture.didTapAttributedTextInLabel(label: lblTermsAndCondition!, inRange: conditionRange) == true || gesture.didTapAttributedTextInLabel(label: lblTermsAndCondition!, inRange: cancellationRange) == true{
            let storyboard = UIStoryboard(name: "RulesViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RulesViewController") as! RulesViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
            
    func getAttributedString(arrayText: [String]?, arrayFonts: [UIFont]?) -> NSMutableAttributedString {
        let finalAttributedString = NSMutableAttributedString()
        for i in 0 ..< (arrayText?.count)!{
            let attributes = [NSAttributedString.Key.font: arrayFonts?[i]]
            let attributesStr = (NSAttributedString.init(string: arrayText?[i] ?? "",
                                                         attributes: attributes as [NSAttributedString.Key : Any]))
            finalAttributedString.append(attributesStr)
        }
        return finalAttributedString
    }
    
}
    
extension SignUpViewController{
    @objc func signInLabelClicked(_ sender: Any){
        if let viewControllers = navigationController?.viewControllers{
            // check signIn view has been in navigation controller yet
            let storyboard = UIStoryboard(name: "SignInViewController", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController? else { return }
            
            if viewControllers.contains(vc){
                navigationController?.popViewController(animated: true)
            }
            else{
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension UITapGestureRecognizer {
    // Stored variables
    typealias MethodHandler = () -> Void
    static var stringRange: String?
    static var function: MethodHandler?
  
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
      
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
      
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
