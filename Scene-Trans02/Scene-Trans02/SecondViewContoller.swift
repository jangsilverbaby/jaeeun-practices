//
//  SecondViewContoller.swift
//  Scene-Trans02
//
//  Created by eunae on 2021/02/19.
//

import UIKit

class SecondViewContoller: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        //dismiss 메소드의 호출 대상 : 현재의 뷰 컨트롤러를 표시해준 컨트롤러
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: Any) {
        //책에서는 아래 코드를 쓰면 "Expression of type 'UIViewController?' is unused"라는 경고문이 뜬다고 하는데 지금은 뜨지 않는다. 경고 내용은 UIViewController? 타입의 값을 반환하는데, 왜 값을 받아주지 않느냐는 것이다.
        //popViewController 메소드의 호출 대상 : 내비게이션 컨트롤러
        navigationController?.popViewController(animated: true)
        
        //스위프트에서 언더바는 대부분 "값을 대입할 변수가 필요한 것은 알고있지만, 나는 그 값이 필요하지 않으니 굳이 변수에 값을 할당하지 말아주세요."라는 의미로 사용된다.
        //_ = navigationController?.popViewController(animated: true)
    }
    
}
