//
//  ViewController.swift
//  IBTest
//
//  Created by eunae on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        uiTitle01.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        uiTitle02.text = "Button02 Clicked"
    }
    
    @IBAction func clickBtn03(_ sender: Any){
        uiTitle03.text = "Button03 Clicked"
    }
    
    @IBAction func clickBtn04(_ sender: Any){
        uiTitle04.text = "Button04 Clicked"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        uiTitle05.text = "Button05 Clicked"
    }
}

