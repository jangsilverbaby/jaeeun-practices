//
//  ViewController.swift
//  Scene-MultiUnwind
//
//  Created by eunae on 2021/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Page 4에서  Home 버튼을 클릭하여 Unwind Segue를 실행하면 Page 1이 화면엘 나타나면서 내비게이션 스택의 중간에 쌓여있던 Page 2, Page 3의 인스턴스는 메모리에서 모두 해제가 된다. 프로그래밍 용어로 dealloc된다고 표현한다.
    //이와 같은 Unwind Segue는 프레젠테이션 방식이나 내비게이션 컨트롤러를 이용한 방식에 구분 없이 실행되는 것이 특징이다.
    //이처럼 되돌아갈 화면의 뷰 컨트롤러 클래스에 UIStoryboardSegue 객체를 인자값으로 받는 메소드를 구현해두기만 하면 이를 시스템이서 Unwind 메소드로 인식한다. 따라서 Exit 아이콘에서 해당 메소드를 연결하는 것으로 Unwind Segue를 손쉽게 구현할 수 있다. 이 때문에 호출될 메소드의 이름은 앱 프로젝트 영역에서 구분되는 이름이어야 하며, 각 뷰 컨트롤러를 대표할 수 있는 이름으로 만드는 것이 좋다.
    @IBAction func goToPage1(_ sender: UIStoryboardSegue){
        
    }

}

