//
//  AppDelegate.swift
//  SubmitValue-Back
//
//  Created by eunae on 2021/02/24.
//

import UIKit

@main //https://seorenn.tistory.com/118
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //값을 저장할 변수를 정의
    var paramEmail: String? //이메일 값을 전달받을 변수
    var paramUpdate: Bool? // 자동 갱신 여부를 전달받을 변수
    var paramInterval: Double? //갱신주기 값을 전달받을 변수


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

