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
    
    
    
    
    
    
    //화면이 표시될 때마다 실행되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated)
        
        let ud = UserDefaults.standard
        
        if let email  = ud.string(forKey: "email")  {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
    }
}

