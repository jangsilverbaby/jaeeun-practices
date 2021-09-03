//
//  FonrtViewController.swift
//  SideBarDIY
//
//  Created by eunae on 2021/09/02.
//

import UIKit

// 앱이 실행되었을 때 사용자에게 보여질 실질적인 첫 화면
class FrontViewController: UIViewController {
    // 사이드 바 오픈 기능을 위임할 델리게이트
    var delegate: ReavealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이드 바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide(_:)))
        
        // 버튼을 내비게이션 바의 왼쪽 영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        // 화면 끝에서 다른 쪽으로 패닝하는 제스처를 정의
        // 패닝 : 화면 한쪽 끝에서 시작하여 반대편까지 드래그가 이어지는 패턴
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = UIRectEdge.left // 시작 모서리는 왼쪽
        self.view.addGestureRecognizer(dragLeft) // 뷰에 제스처 객체를 등록
        
        // 화면을 스와이프하는 제스처를 정의 (사이드 메뉴 닫기용)
        //스와이프 : 중간 위치에서 드래그하는 동작을 인식할 수 있는 제스처 패턴
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left // 방향은 왼쪽
        self.view.addGestureRecognizer(dragRight) // 뷰테 제스처 객체를 등록
    }
    
    // 사용자의 액션에 따라 델리게이트 메소드를 호출한다.
    @objc func moveSide(_ sender: Any) {
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.openSideBar(nil)
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        } else if sender is UIBarButtonItem {
            if self.delegate?.isSideBarShowing == false {
                self.delegate?.openSideBar(nil) // 사이드 바를 연다.
            } else {
                self.delegate?.closeSideBar(nil) // 사이드 바를 닫는다.
            }
        }
    }
}
