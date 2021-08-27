//
//  ViewController.swift
//  CSButton
//
//  Created by eunae on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        let csBtn = CSButton(frame: frame)
        self.view.addSubview(csBtn)
        
        // 인자값에 따른 다른 스타일로 결정되는 버튼 1
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30, y: 200, width: 150, height: 30)
        self.view.addSubview(rectBtn)
        
        // 인자값에 따른 다른 스타일로 결정되는 버튼 2
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 200, width: 150, height: 30)
        self.view.addSubview(circleBtn)
        
        let circleBtn2 = CSButton(type: .circle)
        circleBtn2.frame = CGRect(x: 200, y: 250, width: 150, height: 30)
        self.view.addSubview(circleBtn2)
        
        circleBtn2.style = .rect // 타원 형태로 정의된 버튼의 스타일을 다시 사각형으로 설정
    }
}

