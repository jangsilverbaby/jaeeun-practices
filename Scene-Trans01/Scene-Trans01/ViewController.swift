//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by eunae on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        //이동할 뷰 컨트롤러 객체를 StoryboardID 정보를 이용하여 참조.
        //let uvc = self.storyboard!.instantiateViewController(identifier: "SecondVC")
        
        //UIStoryboard 초기화 과정에서 파일을 직접 지정 (storyboard파일이 여러개일 때)
        //let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //let uvc = storyboard.instantiateViewController(identifier: "SecondVC")
        
        //self.storyboard가 nil일 때 오류가 나지 않도록 옵셔널 체인과 옵셔널 바인딩 구문으로 보강
        /*if let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC"){
            //화면 전환할 때의 애니메니션 타입
            uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            
            //인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
            self.present(uvc, animated: true)
        }*/
        
        //뷰 컨트롤러 인스턴스는 moveNext 메소드 전체 실행에서 비어 있어서는 안되는 필수 조건이기 때문에 guard 조건문으로 필터링
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        //화면 전환할 때의 애니메니션 타입
        uvc.modalTransitionStyle =
            UIModalTransitionStyle.coverVertical
            //UIModalTransitionStyle.crossDissolve
            //UIModalTransitionStyle.flipHorizontal
        
        //인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
        
    }
    
}

