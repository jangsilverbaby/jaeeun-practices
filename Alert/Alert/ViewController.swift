//
//  ViewController.swift
//  Alert
//
//  Created by eunae on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 기본 알림창 버튼 생성
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        self.view.addSubview(defaultAlertBtn)
    }

    @objc func defaultAlert(_ sender: Any) {
        // 1. 알림창을 정의한다.
        let alert = UIAlertController(title: "알림창", message: "기본 메세지가 들어가는 곳", preferredStyle: .alert)
        
        // 2. 버튼을 정의한다.
        let cancleAction = UIAlertAction(title: "Cancle", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        // 3. 버튼을 알림창에 추가한다.
        alert.addAction(cancleAction)
        alert.addAction(okAction)
        
        // 4. 알림창을 화면에 표시한다.
        self.present(alert, animated: false)
    }

}

