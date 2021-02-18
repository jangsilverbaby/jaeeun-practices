//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by eunae on 2021/02/18.
//

import UIKit

class SecondViewControlelr : UIViewController {
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
