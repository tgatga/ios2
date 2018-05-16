//
//  GroupTableViewController.swift
//  Spy
//
//  Created by Assel Tolebayeva on 27.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel!.text = "foo"
        return cell
    }
}
