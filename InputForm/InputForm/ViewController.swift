//
//  ViewController.swift
//  InputForm
//
//  Created by eunae on 2021/08/19.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField! // 이메일 입력 필드
    var paramUpdate: UISwitch! // 스위치 객체
    var paramInterval: UIStepper! // 스테퍼
    var txtUdate: UILabel! // 스위치 컨트롤의 값을 표현할 레이블
    var txtInterval: UILabel! // 스테퍼 컬트롤의 값을 표현할 레이블

    
    override func viewDidLoad() {
        // 1. 내비게이션 바 타이틀을 입력한다.
        navigationItem.title = "설정"
        
        // 2. 이메일 레이블을 생성하고 영역과 기본 문구를 설정한다.
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        // 3. 레이블의 폰트를 설정한다.
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        // 현재 시스템에서 지원하는 폰트 패밀리 목록 확인하는 법
        // 지원하는 폰트 패밀리 목록을 불러온다.
        let fonts = UIFont.familyNames
        // 배열로 반환된 폰트 패밀리 목록을 순회하며 출력한다.
        for f in fonts {
            let font = UIFont.fontNames(forFamilyName: "\(f)")
            print("\(font)")
        }
        
        // 4. 레이블을 루트 뷰에 추가한다.
        view.addSubview(lblEmail)
        
        // 자동생성 레이블을 생성하고 루트 뷰에 추가한다.
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(lblUpdate)
        
        // 갱신주기 레이블을 생성하고 루트 뷰에 추가한다.
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(lblInterval)
        
        // 이메일 입력을 위한 텍스트 필드를 추가한다.
        paramEmail = UITextField()
        paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        paramEmail.font = UIFont.systemFont(ofSize: 13)
        paramEmail.borderStyle = .roundedRect
        paramEmail.autocapitalizationType = .none // 대문자 자동 변환 기능 해제
        
        view.addSubview(paramEmail)
        
        // 스위치 객체를 생성한다.
        paramUpdate = UISwitch()
        paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        
        // 스위치가 On 되어 있는 상태를 기본값으로 설정한다.
        paramUpdate.setOn(true, animated: true)
        
        view.addSubview(paramUpdate)
        
        // 갱신주기를 위한 스테퍼를 추가한다.
        paramInterval = UIStepper()
        
        paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        paramInterval.minimumValue = 0 // 1. 스테퍼가 가질 수 있는 최소값
        paramInterval.maximumValue = 100 // 2. 스테퍼가 가질 수 있는 최대값
        paramInterval.stepValue = 1 // 스테퍼의 값 변경 단위
        paramInterval.value = 0 // 4. 초기값 설정
        
        view.addSubview(paramInterval)
        
        let customFont = UIFont(name: "SDMiSaeng", size: 20)
        
        // 스위치 객체의 값을 표현할 레이블을 추가한다.
        txtUdate = UILabel()
        txtUdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        txtUdate.font = customFont
        txtUdate.textColor = UIColor.red // 1. 텍스트의 색상 설정
        txtUdate.text = "갱신함" // 2. "갱신함" or "갱신하지 않음"
        
        view.addSubview(txtUdate)
        
        // 스테퍼의 값을 텍스트로 표현할 레이블을 추가한다.
        txtInterval = UILabel()
        txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        txtInterval.font = customFont
        txtInterval.textColor = UIColor.red
        txtInterval.text = "0분마다"
        
        view.addSubview(txtInterval)
        
        //스위치와 스테퍼 컨트롤의 Value Changed 이벤트를 각각 액션 메소드에 연결한다.
        paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        // 전송 버튼을 내비게이션 아이템에 추가하고, submit 메소드에 연결한다.
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        navigationItem.rightBarButtonItem = submitBtn
    }
    
    // 스위치와 상호반응할 액션 메소드
    @objc func presentUpdateValue(_ sender: UISwitch) {
        txtUdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    // 스테퍼와 상호반응할 액션 메소드
    @objc func presentIntervalValue(_ sender: UIStepper) {
        txtInterval.text = ("\(Int(sender.value))분마다")
    }
    
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = paramEmail.text
        rvc.pUpdate = paramUpdate.isOn
        rvc.pInterval = paramInterval.value
        
        navigationController?.pushViewController(rvc, animated: true)
    }
}




