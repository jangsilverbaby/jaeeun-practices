//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by eunae on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    //코코아 터치 프레임 워크는 세그웨이가 실행되지 전에 특정한 메소드를 호출하도록 설계되어 있기 때문에, 이를 이용하면 화면을 전환하기 전에 필요한 처리를 해줄 수 있다.
    //이를 전저치 메소드(Pre-Process Method)라고 한다.
    //아래 메소드가 세그웨이를 실행하기 전, 준비작업의 의미로 실행되는 전처리 메소드이다.
    //첫번째 매개변수 : 메소드를 호출한 세그웨이 객체
    //두번째 매개변수 : 세그웨이를 실행하는 트리거에 대한 정보
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //NSLog는 파운데이션 프레임워크에서 정의된 클래스로, 입력된 문자열을 Xcode의 디버그 콘솔에 출력하는 기능을 한다.
        //NSLog("segueway identifier: \(segue.identifier!)")
        
        if segue.identifier == "custom_segue" {
            NSLog("커스텀 세그가 실행됩니다.")
            //커스텀 세그가 실행될 때 처리할 내용을 여기에 작성
        } else if segue.identifier == "action_segue" {
            NSLog("액션 세그가 실행됩니다.")
            //액션 세그가 실행될 때 처리할 내용을 여기에 작성
        } else {
            NSLog("알수 없는 세그입니다.")
            //기타 세그웨이가 실행될 때 처리할 내용을 여기에 작성
        }
    }

    

}

