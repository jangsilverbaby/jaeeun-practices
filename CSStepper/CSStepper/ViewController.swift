//
//  ViewController.swift
//  CSStepper
//
//  Created by eunae on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        // CSStepper 객체 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        self.view.addSubview(stepper)
    }


}

