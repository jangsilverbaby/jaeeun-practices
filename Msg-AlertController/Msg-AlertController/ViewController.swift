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
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의  Apple ID sqlpro@naver.com의 암호를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
                //확인 버튼을 클릭했을 때 처리할 내용
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!)입니다")
            } else {
                print("입력된 값이 없습니다.")
            }
        })
        
        alert.addAction(cancle)
        alert.addAction(ok)
        
        //텍스트 필드 추가
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "암호" //안내 메세지
            tf.isSecureTextEntry = true //비밀번호 처리
        })
        
        present(alert, animated: false)
    }
    
    @IBAction func auth(_ sender: Any) {
        //메세지 창 관련 객체 정의
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            //확인 버튼을 클릭했을 때 실행할 내용
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "sqlpro" && loginPw == "1234" {
                self.result.text = "인증되었습니다"
            } else {
                self.result.text = "인증에 실패하였습니다"
            }
        })
        
        //정의된 액션 버튼 객체를 메세지창에 추가
        alert.addAction(cancle)
        alert.addAction(ok)
        
        //아이디 필드 추가
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "아이디" //미리 보여줄 안내 메세지
            tf.isSecureTextEntry = false //입력시 별표(*) 처리 안함
        })
        
        //비밀번호 필트 추가
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "비밀번호" //미리 보여줄 안내 메세지
            tf.isSecureTextEntry = true //입력시 별표(*) 처리함
        })
        
        present(alert, animated: false)
    }
}

