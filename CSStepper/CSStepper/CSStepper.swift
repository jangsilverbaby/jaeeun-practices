//
//  CSStepper.swift
//  CSStepper
//
//  Created by eunae on 2021/08/30.
//

import UIKit

public class CSStepper: UIView {
    public var leftBtn = UIButton(type: .system) // 좌측 버튼
    public var rightBtn = UIButton(type: .system) // 우측 버튼
    public var centerLabel = UILabel() // 중앙 레이블
    public var value: Int = 0 // 스테퍼의 현재값을 저장할 변수
    
    // 스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // 프로그래밍 방식으로 호출할 초기화 메소드
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        // 여기에 스테퍼의 기본 속성을 설정한다.
        
        let borderWidth: CGFloat = 0.5 // 테두리 두께값
        let borderCololr = UIColor.blue.cgColor // 테두리 색상값
        
        // 좌측 다운 버튼 속성 설정
        self.leftBtn.tag = -1 // 태그값에 -1을 부여
        self.leftBtn.setTitle("↓", for: .normal) // 버튼의 타이틀
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼 타이틀의 폰트
        self.leftBtn.layer.borderWidth = borderWidth // 버튼 테두리 두께
        self.leftBtn.layer.borderColor = borderCololr // 버튼 테두리 색상 - 파란색
        
        // 우측 다운 버튼 속성 설정
        self.leftBtn.tag = 1 // 태그값에 1을 부여
        self.leftBtn.setTitle("↑", for: .normal) // 버튼의 타이틀
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼 타이틀의 폰트
        self.leftBtn.layer.borderWidth = borderWidth // 버튼 테두리 두께
        self.leftBtn.layer.borderColor = borderCololr // 버튼 테두리 색상 - 파란색
        
        // 중앙 레이블 속성 설정
        self.centerLabel.text = String(value) // 컨트롤의 현재값을 문자열로 변환하여 표시
        self.centerLabel.font = UIFont.systemFont(ofSize: 16) // 레이블의 폰트
        self.centerLabel.textAlignment = .center // 가운데 정렬
        self.centerLabel.backgroundColor = .cyan // 배경 색상 지정
        self.centerLabel.layer.borderWidth = borderWidth // 버튼 테두리 두께
        self.centerLabel.layer.borderColor = borderCololr // 버튼 테두리 색상 - 파란색
        
        // 영역별 객체를 서브 뷰로 추가한다.
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
    }
}
