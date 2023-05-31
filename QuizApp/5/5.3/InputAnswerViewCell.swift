//
//  InputAnswerViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func buttonTapped(at indexPath: IndexPath)
}

class InputAnswerViewCell: UITableViewCell {
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var textAnswer: UITextField?
    @IBOutlet weak var setAnswer: UIButton!
    
    var id: Int?
    var type : Int = 0 {  //1: is answer  0: is not Answer
        didSet {
            isAnswer()
        }
    }
    
    weak var delegate: CustomCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        subView.layer.borderWidth = 2
        subView.layer.borderColor = UIColor.init(red: 239/255, green: 238/255, blue: 252/255, alpha: 1).cgColor
        subView.layer.cornerRadius = 20
        isAnswer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func tapButton(_ sender: UIButton){
        if type == 0{
            //sender.setImage(UIImage(named: "isAnswer"), for: .normal)
            type = 1
        }else {
            //sender.setImage(UIImage(named: "notAnswer"), for: .normal)
            self.type = 0
        }
        if let indexPath = indexPath {
            delegate?.buttonTapped(at: indexPath)
        }
    }
    
    func isAnswer(){
        if type == 0{
            setAnswer.setImage(UIImage(named: "notAnswer"), for: .normal)
        }else{
            setAnswer.setImage(UIImage(named: "isAnswer"), for: .normal)
        }
    }
    
    func configure(with indexPath: IndexPath) {
        self.indexPath = indexPath
            // Configure other cell elements
    }
}
