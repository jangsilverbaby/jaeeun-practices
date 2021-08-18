//
//  ViewController.swift
//  Button
//
//  Created by eunae on 2021/08/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 버튼 객체를 생성하고, 속성을 설정한다.
        // 1. 버튼 타입을 인자값으로 하여 버튼 인스턴스를 생성한다.
        let btn = UIButton(type: .system)
        // 2. 버튼 영역을 설정하여 frame 속성에 대입한다.
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        // 3. setTitl(_:for:) 메소드를 이용하여 "테스트 버튼"이라는 문구를 타이틀로 설정한다.
        btn.setTitle("테스트 버튼", for: .normal)
        
        // 버튼을 수평 중앙 정렬한다.
        btn.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        
        // 루트 뷰에 버튼을 추가한다.
        view.addSubview(btn)
    }
    
}

