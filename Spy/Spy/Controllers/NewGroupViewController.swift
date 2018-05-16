//
//  NewGroupViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 26.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseDatabase

class NewGroupViewController: UIViewController {
    var n : String = "#\(Int(arc4random_uniform(9)))\(Int(arc4random_uniform(9)))\(Int(arc4random_uniform(9)))\(Int(arc4random_uniform(9)))\(Int(arc4random_uniform(9)))"
    var ref:DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.title = n
        view.backgroundColor = .white
        self.navigationItem.backBarButtonItem?.title = "fhn"
        ref = Database.database().reference()
        ref?.child("group").childByAutoId().setValue(n)
        setupViews()
    }
    
    lazy var rule : UILabel = {
        let l = UILabel()
        l.text = "min: 5, max: 10 joins in one group!"
        l.font = UIFont(name: "Helvetica", size: 14)
        l.textColor = UIColor(red: 0.823529411764706, green: 0.564705882352941, blue: 0.56078431372549, alpha: 1.0)
        return l
    }()
    lazy var startButton : UIButton = {
        let b = UIButton()
        b.setTitle("start", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.layer.cornerRadius = 20
        b.backgroundColor = .yellow
        b.addTarget(self, action: #selector(push), for: .touchUpInside)
        return b
    }()
    lazy var listTable : UITableView = {
        let t = UITableView()
        return t
    }()
    @objc func push(){
        navigationController?.pushViewController(CardViewController(), animated: true)
    }
    func setupViews(){
        view.addSubview(rule)
        view.addSubview(startButton)
        constrain(rule,startButton) { (rule,start) in
            rule.top == (rule.superview?.top)! + 80
            rule.centerX == (rule.superview?.centerX)!
            
            start.width == (start.superview?.width)!/2.5
            start.height == 40
            start.bottom == (start.superview?.bottom)!-50
            start.centerX == (start.superview?.centerX)!
        }
    }
}
