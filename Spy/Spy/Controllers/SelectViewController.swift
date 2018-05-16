//
//  SelectViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 26.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseDatabase

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    lazy var createButton : UIButton = {
        let v = UIButton()
        v.backgroundColor = UIColor(red: 0.47843137254902, green: 0.168627450980392, blue: 0.533333333333333, alpha: 1.0)
        v.setTitle("Create a group", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.titleLabel?.font = UIFont(name: "Helvetica", size: 30)
        
        v.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        return v
    }()
    @objc func pushView(){
        navigationController?.pushViewController(NewGroupViewController(), animated: true)
    }
    @objc func pushView2(){
        navigationController?.pushViewController(ConnectViewController(), animated: true)
    }

    lazy var connectButton: UIButton = {
        let v = UIButton()
        v.backgroundColor = UIColor(red: 0.501960784313725, green: 0.847058823529412, blue: 0.364705882352941, alpha: 1.0)
        v.setTitle("Connect", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.titleLabel?.font = UIFont(name: "Helvetica", size: 30)
        v.addTarget(self, action: #selector(pushView2), for: .touchUpInside)
        return v
    }()
    
    func setupViews(){
        view.addSubview(createButton)
        view.addSubview(connectButton)

        constrain(createButton,connectButton) { (create,connect) in
            create.width == (create.superview?.width)!
            create.top == (create.superview?.top)!
            create.height == (create.superview?.height)!/2
            connect.width == create.width
            connect.height == create.height
            connect.top == create.bottom
            
        }
    }
}
