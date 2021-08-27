//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by eunae on 2021/08/27.
//

import UIKit

class CSTabBarController: UITabBarController {
    override func viewDidLoad() {
        // 기존 탭 바를 숨김 처리
        self.tabBar.isHidden = true
        
        // 새로운 탭 바 역할을 할 뷰를 위해 기준 좌표와 크기를 정의합니다.
        // 1. 뷰의 너비가 화면 전체 너비와 동일하도록 설정합니다.
        let width = self.view.frame.width
        // 2. 뷰의 높이를 50으로 설정합니다.(기존 탭 바의 기본 높이가 50입니다.)
        let height: CGFloat = 50
        // 3. 뷰가 탭 바처럼 화면의 왼쪽에 빈 공간이 없이 채워지도록 x좌표를 0으로 설정합니다.
        let x: CGFloat = 0
        // 4. 뷰가 화면의 하단까지 빈 공간 없이 채워지도록 화면 전체 높이에서 뷰의 높이를 뺀 만큼을 y좌표로 설정합니다.
        let y = self.view.frame.height - height
        
        // 정의된 값을 이용하여 새로운 뷰의 속성을 설정합니다.
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        
        self.view.addSubview(self.csView)
        
    }
    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
}
