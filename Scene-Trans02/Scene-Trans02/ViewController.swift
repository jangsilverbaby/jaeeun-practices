//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by eunae on 2021/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveByNavi(_ sender: Any) {
        //두 번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        //화면을 전환한다.
        //pushViewController 메소드의 호출 대상 : 내비게이션 컨트롤러
        navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        //두 번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        //화면을 전환한다.
        //present 메소드의 호출 대상 : 뷰 컨트롤러 자신
        present(uvc, animated: true)
    }
    
}

