//
//  ConnectViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 27.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseDatabase

class ConnectViewController: UIViewController {
    let nextColor = UIColor(red: 0.443137254901961, green: 0.36078431372549, blue: 0.0666666666666667, alpha: 1.0)
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    lazy var hashtagIcon : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "hashtag")
        return img
    }()
    lazy var groupTextField : UITextField = {
        let t = UITextField()
        t.placeholder = "Group number"
        t.textColor = UIColor(red: 0.815686274509804, green: 0.772549019607843, blue: 0.611764705882353, alpha: 1.0)
        t.setBottomBorder()
        t.backgroundColor =  .white
        t.font = UIFont(name: "Helvetica", size: 18)
        t.textAlignment = .center
        return t
    }()
    
    lazy var nextButton: UIButton = {
        let b = UIButton()
        b.setTitle("connect", for: .normal)
        b.setTitleColor(nextColor, for: .normal)
        
        b.addTarget(self, action: #selector(push), for: .touchUpInside)
        return b
    }()
    
    @objc func push() {
        if(groupTextField.text != "" ){
            
            self.navigationController?.pushViewController(CardViewController(), animated: true)
        }
    }
    func setupViews(){
        
        view.backgroundColor = .white
        view.addSubview(groupTextField)
        view.addSubview(nextButton)
        view.addSubview(hashtagIcon)
        constrain(groupTextField,nextButton,hashtagIcon) { (group,next,icon) in
            group.centerY == (group.superview?.centerY)!-50
            group.centerX == (group.superview?.centerX)!
            group.width == (group.superview?.width)!/1.5
            group.height == 40
            
            next.centerX == (next.superview?.centerX)!
            next.width == 100
            next.height == 50
            
            icon.width == 30
            icon.height == 30
            icon.centerY == group.centerY
            icon.centerX == group.centerX - 90
            distribute(by: 50, vertically: group, next)
            
        }
    }
}
