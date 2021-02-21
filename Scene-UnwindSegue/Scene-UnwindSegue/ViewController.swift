//
//  ViewController.swift
//  Scene-UnwindSegue
//
//  Created by eunae on 2021/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //코코아 터치 시스템은 앱 내부에 정의된 모든 메소드를 스캔하여, 이 중에서 UIStoryboardSegue 타입의 인자값을 입력받는 액션메소드를 모두 수집한다. 그리고 Exit 아이콘 목록으로 출력한다.
    //Page B에 추가된 버튼을 <Ctrl> + 드래그하여 상단의 Exit 아이콘으로 연결하고, 이어서 표시되는 선택창에서의 메소드들 중 하나를 선택하여 연결하면, 해당 메소드가 정의된 뷰 컨트롤러로 돌아가는 Unwind 메소드가 만들어 진다.
    //아래 메소드는 말하자면 현재 화면을 종료했을 때 어느 화면으로 이동할지 여부를 할기 위한 이정표 역할인 것이다.
    //화면을 종료하면 이 메소드가 있는 뷰 컨트롤러로 이동
    //unwind 메소드 (= 이정표 메소드)
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){
            
    }
    
}

