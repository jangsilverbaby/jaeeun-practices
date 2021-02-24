//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by eunae on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    //값을 화면에 표시하기 위한 아울렛 변수들
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    //값을 직접 전달받을 프로퍼티들
    var paramEmail: String? //이메일 값을 전달받을 속성
    var paramUpdate: Bool? //자동 갱신 여부를 전달받을 속성
    var paramInterval: Double? //갱신주기 값을 전달받을 속성
    
    //화면이 표시될 때마다 실행되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let email  = paramEmail  {
            resultEmail.text = email
        }
        
        if let update = paramUpdate  {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }
    }
}

