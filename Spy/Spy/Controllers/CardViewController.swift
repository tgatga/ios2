//
//  CardViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 27.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography

class CardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Don't show who you are!"
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        setupViews()
    }
    
    lazy var localizationLabel : UILabel = {
        let l = UILabel()
        l.text = "Localization"
        l.textAlignment = .center
        l.font = UIFont(name: "Helvetica", size: 20)
        l.textColor = UIColor(red: 0.823529411764706, green: 0.564705882352941, blue: 0.56078431372549, alpha: 1.0)
        return l
    }()
    
    lazy var my_localization : UILabel = {
        let l = UILabel()
        l.text = "LIBRARY"
        l.textAlignment = .center
        l.font = UIFont(name: "Helvetica", size: 40)
        l.textColor = .black
        return l
    }()
    
    lazy var roleLabel : UILabel = {
        let l = UILabel()
        l.text = "You are"
        l.font = UIFont(name: "Helvetica", size: 20)
        l.textColor = UIColor(red: 0.823529411764706, green: 0.564705882352941, blue: 0.56078431372549, alpha: 1.0)
        return l
    }()
    
    lazy var my_role : UILabel = {
        let l = UILabel()
        l.text = "Library Assistant"
        l.font = UIFont(name: "Helvetica", size: 30)
        l.textColor = .black
        return l
    }()
    
    lazy var stopButton : UIButton = {
        let b = UIButton()
        b.setTitle("stop", for: .normal)
        b.backgroundColor = .red
        b.layer.cornerRadius = 40
        return b
    }()
    
    lazy var timeLabel : UILabel = {
        let l = UILabel()
        l.text = "time:"
        l.font = UIFont(name: "Helvetica", size: 16)
        l.textColor = .gray
        return l
    }()
    
    func setupViews(){
        view.addSubview(localizationLabel)
        view.addSubview(roleLabel)
        view.addSubview(my_localization)
        view.addSubview(my_role)
        view.addSubview(stopButton)
        view.addSubview(timeLabel)
        
        constrain(localizationLabel,roleLabel,my_localization,my_role,stopButton,timeLabel) { (local,role,my_local,my_role,stopButton,timeLabel) in
            local.width == (local.superview?.width)!-40
            local.height == 20
            local.centerY == (local.superview?.centerY)! - 190
            local.centerX == (local.superview?.centerX)!
            
            my_local.centerX == (my_local.superview?.centerX)!
            my_local.width == (my_local.superview?.width)!-40
            my_local.height == 75
            
            role.width == local.width
            role.left == (role.superview?.left)!+40
            role.height == local.height
            role.centerY == (role.superview?.centerY)!+20
            
            my_role.width == role.width
            my_role.height == 35
            my_role.left == role.left
                
            distribute(by: 1, vertically: local,my_local)
            distribute(by: 1, vertically: role,my_role)
            
            stopButton.width == 80
            stopButton.height == 80
            stopButton.right == (stopButton.superview?.right)!-40
            stopButton.bottom == (stopButton.superview?.bottom)!-100
            
            timeLabel.width == 40
            timeLabel.height == 20
            timeLabel.bottom == (timeLabel.superview?.bottom)!-40
            timeLabel.left == (timeLabel.superview?.left)!+40
        }
    }
}
