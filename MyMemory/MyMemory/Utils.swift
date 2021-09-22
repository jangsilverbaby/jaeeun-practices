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
}
