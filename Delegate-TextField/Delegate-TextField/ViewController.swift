//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by eunae on 2021/05/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        //텍스트 필드 속성 설정
        tf.placeholder = "값을 입력하세요" // 안내 메세지
        tf.keyboardType = UIKeyboardType.alphabet // 키보드 타입 영문자 패드로
        tf.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일 어둡게
        tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입은 "Join"
        tf.enablesReturnKeyAutomatically = true // 라턴키 자동 활성화 "On"
        
        /**
         * 스타일 설정
         */
        // 테두리 스타일 - 직선
        tf.borderStyle = UITextField.BorderStyle.line
        // 배경 생상
        tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        // 수직 방향으로 텍스트가 가운데 정렬되도록
        tf.contentVerticalAlignment = .center
        // 수평 방향으로 텍스트가 가운데 정렬되도록
        tf.contentHorizontalAlignment = .center
        // 테두리 색상을 회색으로
        tf.layer.borderColor = UIColor.darkGray.cgColor
        // 테두리 두께 성정 (단위: pt)
        tf.layer.borderWidth = 2.0
        
        // 텍스트 필드를 최초 응답자로 지정
        tf.becomeFirstResponder()
        
        //델리게이트 지정
        tf.delegate = self
    }
    
    @IBAction func confirm(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체에서 해제
        tf.resignFirstResponder()
    }
    @IBAction func input(_ sender: Any) {
        // 텍스트 필드를 최초 응답자 객체로 지정
        tf.becomeFirstResponder()
    }
    
    // 텍스트 필드의 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true // false를 리턴하면 편집되지 않는다.
    }
    // 텍스트 필드의 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작되었습니다.")
    }
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true // false를 리턴하면 삭제되지 않는다.
    }
    // 텍스트 필드의 내용이 변경될 떄 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴
            if (textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        } else { // 입력된 값이 숫자라면 false를 리턴
            return false
        }
    }
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    // 택스트 필드 편집이 종료될 떄 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true // false를 리턴하면 편집이 종료되지 않는다.
    }
    //텍스트 필드의 편집이 종료되었을 때 출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
    
}

