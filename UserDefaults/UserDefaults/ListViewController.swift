//
//  ListViewController.swift
//  UserDefaults
//
//  Created by eunae on 2021/09/09.
//

import UIKit

class ListViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var married: UIView!
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
    }
    @IBAction func changeMarried(_ sender: UISwitch) {
    }
}
