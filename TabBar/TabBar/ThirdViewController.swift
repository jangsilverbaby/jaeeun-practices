//
//  ThirdViewController.swift
//  TabBar
//
//  Created by eunae on 2021/08/20.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        // 2. title 레이블 속성 설정
        title.text = "세번째 탭"
        title.textColor = .red // 텍스트는 빨간색으로
        title.textAlignment = .center // 레이블 내에서 중앙 정렬로
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 System Font, 14pt
        
        // 3. 콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        // 4. X축의 중앙에 오도록 설정
        title.center.x = view.frame.width / 2
        
        // 5. 수퍼 뷰에 추가
        view.addSubview(title)
        
        
    }


}
