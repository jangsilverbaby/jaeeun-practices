//
//  Utils.swift
//  MyMemory
//
//  Created by eunae on 2021/09/22.
//

import UIKit

// 익스텐션(extension): 원래의 클래스를 수정하거나 편집하지 않고도 원하는 임의의 프로퍼티나 메소드를 추가할 수 있는 스위프트 문법, 저장 프로퍼티를 정의할 수 없으며, 기존 메소드의 오버라이딩도 지원하지 않음
extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
    
    func alert(_ message: String, completion: (()->Void)? = nil) {
        // 메인 스레드에서 실행되도록
        // URLSession 객체는 비동기 방식으로 동작함녀서 종종 응답 결과 처리를 서브 스레드에 맡기기 때문에 해당 메소드가 서브 스레드에서 호출될 경우를 방지하기 위해 알림창을 실행하는 구문이 메인 큐에서 처리되도록 블록으롬 감쌈
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                completion?() // completion 매개변수의 값이 nil이 아닐 때에만 실행되도록
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
