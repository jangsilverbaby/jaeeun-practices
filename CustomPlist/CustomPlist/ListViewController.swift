//
//  ListViewController.swift
//  CustomPlist
//
//  Created by eunae on 2021/09/15.
//

import UIKit

class ListViewController : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var account: UITextField!
    
    var accountlist = [String]()
    
    override func viewDidLoad() {
        let picker = UIPickerView()
        
        // 1. 피커 뷰의 델리게이트 객체 지정
        picker.delegate = self
        // 2. account 텍스트 필드 입력 방식을 가상 키보드 대신 피커 뷰로 설정
        self.account.inputView = picker
        
        // 툴 바 객체 정의
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 36)
        toolbar.barTintColor = .lightGray
        
        // 액세서리 뷰 영역에 툴바를 표시
        self.account.inputAccessoryView = toolbar
        
        // 툴 바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        // 가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 신규 계정 등록 버튼
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(newAccount(_:))
        
        // 버튼을 툴 바에 추가
        toolbar.setItems([new, flexSpace, done], animated: true)
    }
    
    // 생성할 컴포넌트의 개수를 정의합니다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 지정된 컴포넌트가 가질 목록의 길이를 정의합니다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountlist.count
    }
    
    // 지정된 컴포넌트의 목록 각 행에 출력될 내용을 정의합니다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountlist[row]
    }
    
    // 지정된 컴포넌트의 목록 각 행을 사용자가 선택했을 때 실행할 액션을 정의합니다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 1. 선택된 계정값을 텍스트 필드에 입력
        let account = self.accountlist[row] // 선택된 계정
        self.account.text = account
    }
    
    @objc func pickerDone(_ sender: Any) {
        // 2. 입력 뷰를 닫음
        self.view.endEditing(true)
    }
    
    @objc func newAccount(_ sender: Any) {
        self.view.endEditing(true) // 일단 열려있는 입역용 뷰부터 닫아준다.
        
        // 알림창에 객체 생성
        let alert = UIAlertController(title: "새 계정을 입력하세요", message: nil, preferredStyle: .alert)
        
        // 입력폼 추가
        alert.addTextField() {
            $0.placeholder = "ex) abc@gmail.com"
        }
        
        // 버튼 및 액션 정의
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            if let account = alert.textFields?[0].text {
                // 계정 목록 배열에 추가한다.
                self.accountlist.append(account)
                // 계정 텍스트 필드에 표시한다.
                self.account.text = account
            }
        })
        // 알림창 오픈
        self.present(alert, animated: false, completion: nil)
    }
}
