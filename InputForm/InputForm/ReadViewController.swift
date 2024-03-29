//
//  ReadViewController.swift
//  InputForm
//
//  Created by eunae on 2021/08/19.
//

import UIKit

class ReadViewController: UIViewController {
    // 전달될 값을 저장할 변수를 정의한다.
    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경 색상을 설정한다.
        view.backgroundColor = .white
        
        // 레이블 객체를 정의한다.
        let email = UILabel()
        let update = UILabel()
        let interval = UILabel()
        
        // 위치와 영역을 정의한다.
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        update.frame = CGRect(x: email.frame.origin.x, y: 150, width: 300, height: 30)
        interval.frame = CGRect(x: email.frame.origin.x, y: 200, width: 300, height: 30)
        
        // 전달받은 값을 레이블에 표시한다.
        email.text = "전달받은 이메일 : \(pEmail!)"
        update.text = "업데이트 여부 : \(pUpdate == true ? "업데이트 함" : "업데이트 안함")"
        interval.text = "업데이트 주기 : \(Int(pInterval!))분마다"
        
        // 레이블 루트 뷰에 추가한다.
        view.addSubview(email)
        view.addSubview(update)
        view.addSubview(interval)
    }
}
