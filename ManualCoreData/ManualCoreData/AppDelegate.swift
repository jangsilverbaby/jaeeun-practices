//
//  AppDelegate.swift
//  ManualCoreData
//
//  Created by eunae on 2021/11/01.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // 프로젝트를 생성할 때 Use Core Data 옵션에 체크했더라면 자동으로 생성되어있을 템플릿 구문
    // 엔터티가 정의된 데이터 모델 파일을 기반으로 영구 저장소를 연결하고 이를 컨테이너 객체로 만들어 반환하는 클로저
    // 지연 멤버 변수의 초기화 구문 형식으로 작성되었기 깨문에 위 코드는 변수가 처음 참조될 때 딱 한번 실행된 다음, 앱 종료 시까지 이 값 유지
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores {
            if let error = $1 as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // 프로젝트를 생성할 때 Use Core Data 옵션에 체크했더라면 자동으로 생성되어있을 템플릿 구문
    // 관리 컨텍스트에 변경된 내용이 있는지 체크해서 변경사항을 영구 저장소에 반영해 줌
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    // 앱 종료시 컨텍스트가 자동으로 저장되도록 하는 델리게이트 메소드
    // 앱이 종료되려고 할 때 호출
    // 앱 종료 전에 무엇인가 정리해야 할 리소스 혹은 저장되지 않은 내용이 있다면, 이를 처리하는 코드를 이 메소드 내에 넣어둔다.
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

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

