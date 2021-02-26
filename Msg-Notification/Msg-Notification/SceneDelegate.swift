//
//  SceneDelegate.swift
//  Msg-Notification
//
//  Created by eunae on 2021/02/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    //책과 다른 점, https://turume.tistory.com/62 참고
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        if #available(iOS 10.0, *) { //UserNotificationSetting 프레임워트를 이용한 로컬 알림 (iOS 10 이상)
            //알림 동의 여부를 확인
            UNUserNotificationCenter.current().getNotificationSettings{settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    //알림 콘텐츠 객체
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메세지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!!"
                    nContent.body = "앗! 왜 나갔어요??? 어서 들어오세요!!"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name": "홍길동"]
                    
                    //알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    //알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    //노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음!!!")
                }
            }
        } else { //UILocalNotification 객체를 이용한 로컬 알림 (iOS 9 이하)
            let application = UIApplication.shared
            //알림 설정 확인
            //현재 설정된 알림 허용 여부 정보를 읽어온다.
            let setting = application.currentUserNotificationSettings
            
            //알림 설정이 되어 있지 않다면 로컬 알림을 보내도 받을 수 없으므로 종료함
            guard setting?.types != .none else {
                print("Can't Schedule")
                return
            }
            
            //로컬 알림 인스턴스 생성
            let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10) //10초 후 발송
            noti.timeZone = TimeZone.autoupdatingCurrent //현재 위치에 따라 타임존 설정
            noti.alertBody = "얼른 다시 접속하세요!!" //표시될 메세지
            noti.alertAction = "학습하기" //잠금 상태일 때 표시될 액션
            noti.applicationIconBadgeNumber = 1 //앱 아이콘 모서리에 표시될 배지
            noti.soundName = UILocalNotificationDefaultSoundName //로컬 알람 도착시 사운드
            noti.userInfo = ["name": "홍길동"] //알람 실행시 함께 전달하고 싶은 값. 화면에는 표시되지 않음
            
            //생성된 알림 객체를 iOS의 스케줄러에 등록한다. 등록된 알림 객체는 fireDate 속성에 설정된 시간에 맞게 발송된다.
            application.scheduleLocalNotification(noti)
            //생성된 알림 객체의 fireDate 속성을 무시하고 즉각 발송한다.
            //application.presentLocalNotificationNow(noti)
        }
    }
    

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

