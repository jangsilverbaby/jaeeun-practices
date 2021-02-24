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
        
        //UserDefault 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        //UserDefault는 시스템에서 제공하는 단일 객체이므로 UserDefaults.standard 프로퍼티를 사용하여 읽어와야 한다. 이 프로퍼티는 클래스 프로퍼티이므로 UserDefaults 인스턴스를 생성하지 않고도 사용할 수 있다.
        
        
        
        //값을 저장한다.
        ud.set(email.text, forKey: "email")
        ud.set(isUpdate.isOn, forKey: "isUpdate")
        ud.set(interval.value, forKey: "interval")
        
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
