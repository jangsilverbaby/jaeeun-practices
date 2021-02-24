//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by eunae on 2021/02/24.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField! //이메일
    @IBOutlet var isUpdate: UISwitch! //자동갱신 여부
    @IBOutlet var interval: UIStepper! //갱신주기
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    //Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        
        //presentingViewController 속성을 통해 이번 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        
        //값을 전달한다.
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        //이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
        
        //데이터 전달이 안되서 Storyboard Segue 익스펙터의 Presentation 속성을 fullScreen으로 변경
        //https://leefilll.github.io/2020-04-12/swift-modal-in-ios13
        
    }
   
    @IBAction func `switch`(_ sender: UISwitch) {
        isUpdateText.text = sender.isOn == true ? "자동갱신" : "자동갱신안함"
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        intervalText.text = "\(Int(sender.value))분마다"
    }
}
