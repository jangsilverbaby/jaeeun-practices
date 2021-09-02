//
//  RevealViewController.swift
//  SideBarDIY
//
//  Created by eunae on 2021/09/02.
//

import UIKit

// 스토리보드 가장 앞에 위치하여 프론트 뷰와 리어 뷰를 컨트롤할 뷰 컨트롤러
class ReavealViewController: UIViewController {
    var contentVC: UIViewController? // 콘텐츠를 담당할 뷰 컨트롤러
    var sideVC: UIViewController? // 사이드 바 메뉴를 담당할 뷰 컨트롤러
    var isSideBarShowing = false // 현재 사이드 바가 열려 있는지 여부
    let SLIDE_TIME = 0.3 // 사이드 바가 열리고 닫히는 데 걸리는 시간
    let SIDEBAR_WIDTH: CGFloat = 260 // 사이드 바가 열릴 너비
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // 초기 화면을 설정한다.
    func setupView() {
        // 1. _프론트 컨트롤러 객체를 읽어온다.
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            // 2. 읽어온 컨트롤러를 클래스 전체에서 참조할 수 있도록 contectVC 속성에 저장한다.
            self.contentVC = vc
            // 3. _프론트 컨트롤러 객체를 메인 컨트롤러의 자식으로 등록한다.
            self.addChild(vc) // _프론트 컨트롤러를 메인 컨트롤러의 자식 뷰 컨트롤러로 등록
            self.view.addSubview(vc.view) // _프론트 컨트롤로의 뷰를 메인 컨트롤러의 서브 뷰로 등록
            // 뷰와 뷰 컨트롤러 계층은 서로 분리되어있다. 즉, 독립 구조.
            // _프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다.
            vc.didMove(toParent: self)
        }
    }
    
    // 사이드 바의 뷰를 읽어온다.
    func getSideView() {
        
    }
    
    // 콘텐츠 뷰에 그림자 효과를 준다.
    func setShadowEffect(shadow: Bool, offset:CGFloat) {
        
    }
    
    // 사이드 바를 연다.
    func openSideBar(_ complete: (() -> Void)? ) {
        
    }
    
    // 사이드 바를 닫는다.
    func closeSideBar(_ complete: (() -> Void)? ) {
        
    }
}