//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by eunae on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        //메세지 창을 처리하기 부적절한 위치(아직 뷰가 화면에 구현되지 전임)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //메세지 창을 처리하기 적절한 위치
    }

    @IBAction func alert(_ sender: Any) {
        //메세지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "취소", style: .cancel, handler: {(_) in
            self.result.text = "취소 버튼을 클릭했습니다"
        }) //취소 버튼
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            self.result.text = "확인 버튼을 클릭했습니다"
        }) //확인  버튼
        let exec = UIAlertAction(title: "실행", style: .destructive, handler: {(_) in
            self.result.text = "실행 버튼을 클릭했습니다"
        }) //실행 버튼
        let stop = UIAlertAction(title: "중지", style: .default, handler: {(_) in
            self.result.text = "중지 버튼을 클릭했습니다"
        }) //중지 버튼
        
        //버튼을 컨트롤러에 등록
        alert.addAction(cancle)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        //메세지창 실행
        present(alert, animated: false)

    }
    
}

