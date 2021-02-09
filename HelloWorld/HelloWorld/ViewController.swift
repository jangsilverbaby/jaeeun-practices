//
//  ViewController.swift
//  HelloWorld
//
//  Created by eunae on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var uiTitle: UILabel! //인터페이스 빌더의 레이블을 스위프트 클래스가 참조할 수 있도록 연결된 멤버변수로, 아울렛 변수라고 부름. @IBOutlet이라는 키워드는 인터페이스 빌더에 관련된 속성이라는 것을 알려주는 어노테이션.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func syayHello(_ sender: Any) {
        uiTitle.text = "Hello, World!"
    }
    

}

