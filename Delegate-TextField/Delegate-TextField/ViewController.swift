//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by eunae on 2021/05/25.
//

import UIKit

class ViewController: UIViewController {
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
    }
    
    @IBAction func confirm(_ sender: Any) {
        //텍스트 필드를 최초 응답자 객체에서 해제
        tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        //텍스트 필드를 최초 응답자 객체로 지정
        tf.becomeFirstResponder()
    }
}

