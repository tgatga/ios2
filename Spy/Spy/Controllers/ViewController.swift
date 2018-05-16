//
//  ViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 25.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseDatabase

class ViewController: UIViewController {
    
let nextColor = UIColor(red: 0.443137254901961, green: 0.36078431372549, blue: 0.0666666666666667, alpha: 1.0)
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupViews()
    }
    var ref : DatabaseReference?
    @objc func saveName(){
        ref = Database.database().reference()
        if nameTextField.text != ""{
            ref?.child("name").childByAutoId().setValue(nameTextField.text)
        }
    }
    
    lazy var nameTextField : UITextField = {
        let t = UITextField()
        t.placeholder = "Write your name"
        
        t.textColor = UIColor(red: 0.815686274509804, green: 0.772549019607843, blue: 0.611764705882353, alpha: 1.0)
        t.setBottomBorder()
        t.backgroundColor =  UIColor(red: 1.0, green: 0.972549019607843, blue: 0.874509803921569, alpha: 1.0)
        t.font = UIFont(name: "Helvetica", size: 18)
        t.textAlignment = .center
        return t
    }()
    
    lazy var nextButton: UIButton = {
        let b = UIButton()
        b.setTitle("next", for: .normal)
        b.setTitleColor(nextColor, for: .normal)
        b.addTarget(self, action: #selector(saveName), for: .touchUpInside)
        b.addTarget(self, action: #selector(push), for: .touchUpInside)
        return b
    }()
    @objc func push() {
        let vc = SelectViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setupViews(){
        
        view.backgroundColor = UIColor(red: 1.0, green: 0.972549019607843, blue: 0.874509803921569, alpha: 1.0)
        view.addSubview(nameTextField)
        view.addSubview(nextButton)
        
        
        constrain(nameTextField,nextButton) { (name,next) in
            name.centerY == (name.superview?.centerY)!-50
            name.centerX == (name.superview?.centerX)!
            name.width == (name.superview?.width)!/1.5
            name.height == 40
            
            next.centerX == (next.superview?.centerX)!
            next.width == 100
            next.height == 50
            distribute(by: 50, vertically: name, next)
            
        }
    }
}

