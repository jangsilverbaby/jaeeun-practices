//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by eunae on 2021/02/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    //화면에 값을 표시하는데 사용될 레이블
    @IBOutlet var resultEmail: UILabel! //이메일
    @IBOutlet var resultUpdate: UILabel! //자동갱신 여부
    @IBOutlet var resultInterval: UILabel! //갱신주기
    
    //아울렛 변수를 사용해서 값을 전달받을 수 없다. 왜냐하면 아울렛 변수는 외부에서 값을 직접 대입할 수 없는 변수이기 때문이다. 대신 시스템에 의해 값이 주입된다. 게다가 아울렛 변수는 외부 객체에서 직접 참조할 수 없도록 제한되어있다. 그렇기 때문에 값을 대입할 프로퍼티를 따로 정의해 주어야 한다.
    
    //email 값을 받을 변수
    var paramEmail: String = ""
    //update 값을 받을 변수
    var paramUpdate: Bool = false
    //interval 값을 받을 변수
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        resultEmail.text = paramEmail
        resultUpdate.text = paramUpdate == true ? "자동갱신" : "자동갱신안함"
        resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
}
