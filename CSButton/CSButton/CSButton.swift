//
//  CSButton.swift
//  CSButton
//
//  Created by eunae on 2021/08/27.
//

import UIKit

// 버튼 타입을 결정한느 열거형
public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // 스토리보드 방식으로 버튼을 정의했을 때 적용됩니다.
        self.backgroundColor = .green // 배경을 녹색으로
        self.layer.borderWidth = 2 // 테두리는 조금 두껍게
        self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
        self.setTitle("버튼", for: .normal) // 기본 문구 설정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray // 배경을 회색으로
        self.layer.borderWidth = 2 // 테두리는 조금 두껍게
        self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
        self.setTitle("코드로 생성된 버튼", for: .normal) // 기본 문구 설정
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = .black // 배경을 검정색으로
            self.layer.borderWidth = 2 // 테두리는 조금 두껍게
            self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
            self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
            self.setTitleColor(.white, for: .normal) // 글씨는 흰색으로
            self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
        case .circle:
            self.backgroundColor = .red // 배경을 빨간색으로
            self.layer.borderWidth = 2 // 테두리는 조금 두껍게
            self.layer.borderColor = UIColor.black.cgColor // 테두리는 파란색으로
            self.layer.cornerRadius = 50 // 50만큼 둘글게 처리
            self.setTitle("Circle Button", for: .normal) // 기본 문구 설정
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect:
                self.backgroundColor = .black // 배경을 검정색으로
                self.layer.borderWidth = 2 // 테두리는 조금 두껍게
                self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
                self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
                self.setTitleColor(.white, for: .normal) // 글씨는 흰색으로
                self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
            case .circle:
                self.backgroundColor = .red // 배경을 빨간색으로
                self.layer.borderWidth = 2 // 테두리는 조금 두껍게
                self.layer.borderColor = UIColor.black.cgColor // 테두리는 파란색으로
                self.layer.cornerRadius = 50 // 50만큼 둘글게 처리
                self.setTitle("Circle Button", for: .normal) // 기본 문구 설정
            }
        }
    }
    
    // 버튼 객체 내부에 자체적으로 액션 메소드 정의
    // 버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해주는 함수
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag)번째 클릭", for: .normal)
    }
}
