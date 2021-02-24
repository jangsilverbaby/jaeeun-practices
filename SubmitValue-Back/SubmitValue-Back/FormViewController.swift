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
        
        //AppDelegate 객체의 인스턴스를 가져온다.
        let ad = UIApplication.shared.delegate as? AppDelegate
        //싱글톤 특성 때문에 UIApplication.shared.delegate 구문을 통해 현재 생성되어 있는 인스턴스를 참조한다.
        
        
        
        //값을 지정한다.
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        
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
