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
        
        // 버튼의 이벤트와 메소드 btnOnClick(_:)을 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }
    
    // 사용자가 버튼을 터치 했을 때 반응할 액션 메소드
    /* 1. 매개변수 : 이벤트가 발생한 객체 정보를 전달받을 수 있도록 Any 혹은 해당 객체 타입의 첫 번째 매개변수를 정의해야 한다.
       2. 첫 번째 매개변수의 타입은 Any, AnyObject 또는 호출한 객체의 타입이어야 한다.
       3. @objc 어트리뷰트를 붙여 오브젝티브-C에서도 인식할 수 있도록 해야 한다. */
    @objc func btnOnClick(_ sender: Any) {
        // 호출된 객체가 버튼이라면
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다", for: .normal)
        }
    }
}

