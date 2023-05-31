//
//  CollectionViewCell.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var number: UILabel!
    var id: Int?
    var select: Bool = false {
        didSet{
            setSelect()
        }
    }
    var status : Bool = false{
        didSet{
            setStatus()
        }
    }
    var choosen: Bool = false{
        didSet{
            setChoosen()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 25
        // Initialization code
    }
    
    func setSelect() {
        if select {
            cellView.backgroundColor =  UIColor(red: 123/255, green: 109/255, blue: 228/255, alpha: 1)
            number.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        } else {
            cellView.backgroundColor =  .clear
            number.textColor = UIColor(red: 133/255, green: 132/255, blue: 148/255, alpha: 1)
        }
    }

    func setStatus(){
        if status{
            number.textColor = UIColor(red: 99/255, green: 156/255, blue: 253/255, alpha: 1)
        }else{
            number.textColor = UIColor(red: 255/255, green: 143/255, blue: 162/255, alpha: 1)
        }
    }

    func setChoosen(){
        if choosen{
            cellView.backgroundColor =  UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)
            number.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }else{
            cellView.backgroundColor =  .clear
            number.textColor = UIColor(red: 133/255, green: 132/255, blue: 148/255, alpha: 1)
        }
    }
}
