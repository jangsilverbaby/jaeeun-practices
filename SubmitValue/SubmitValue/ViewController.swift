//
//  ViewController.swift
//  SubmitValue
//
//  Created by eunae on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    //이메일 주소를 입력받는 텍스트필드
    @IBOutlet var email: UITextField!
    
    //자동 갱신 여부를 설정하는 스위치
    @IBOutlet var isUpdate: UISwitch!
    
    //갱신 주기를 설정하는 스테퍼
    @IBOutlet var interval: UIStepper!
    
    //자동갱신 여부를 표시하는 레이블
    @IBOutlet var isUpdateText: UILabel!
    
    //갱신주기를 텍스트로 표시하는 레이블
    @IBOutlet var intervalText: UILabel!
    
    //엑션 메소드를 정의할 때 매개변수 타입
    //개별 타입을 선택해야 할 때 : 액션 메소드를 호출한 컨트롤의 속성값이 필요하거나, 이를 제어해야 할 때
    //Any 타입을 선택해야 할 때 : 서로 다른 타입의 컨트롤이 동일한 액션메소드를 호출하게끔 처리하고 싶을 때, 액션 메소드를 호출한 컨트롤의 정보가 필요 없을 때, 개별 타입을 반드시 사용해야 하는 경우를 제외한 나머지 모든 경우
    
    //자동 갱신 여부가 바뀔 때마다 호출되는 메소드
    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    //갱신주기가 바뀔 때마다 호출되는 메소드
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        //VC2의 인스턴스 생성
        guard let rvc = storyboard?.instantiateViewController(identifier: "RVC") as? ResultViewController else {
            return
        }
        
        //값 전달
        rvc.paramEmail = email.text! //이메일
        rvc.paramUpdate = isUpdate.isOn //자동갱신 여부
        rvc.paramInterval = interval.value //갱신주기
        
        //화면이동
        present(rvc, animated: true)
        navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        performSegue(withIdentifier: "ActionSubmit", sender: self)
    }
    
    //세그웨이가 실행되기 직전에 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //세그웨이를 다룰 때에는 이동할 대상 뷰 컨트롤러의 인스턴스를 직접 생성하면 안된다. 세그웨이의 목적지로 연결된 뷰 컨트롤러의 인스턴스는 세그웨이에 의해 자동으로 생성되기 때문에 , 메소드를 이용하여 생성한 인스턴스와는 일치하지 않는다.
        //목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        rvc.paramEmail = email.text! //이메일
        rvc.paramUpdate = isUpdate.isOn //자동갱신 여부
        rvc.paramInterval = interval.value //갱신주기
    }
    
}




