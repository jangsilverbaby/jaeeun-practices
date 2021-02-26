//
//  ViewController.swift
//  Msg-Notification
//
//  Created by eunae on 2021/02/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet var msg: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBAction func save(_ sender: Any) {
        if #available(iOS 10, *){ //UserNotifications  프레임워크를 사용한 로컬 알림
            //알림 동의 여부를 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    //알림 설정이 들어갈 곳
                    //백그라운그에서 실행되는 로직을 메인 쓰레드에서 실행되도록 처리해주는 역할
                    DispatchQueue.main.async {
                        //알림 콘텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        
                        //발송 시각을 '지금으로 부터 *초 형식'으로 변환
                        let time = self.datePicker.date.timeIntervalSinceNow
                        //발송 조건 정의
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        //발송 요청 객체 정의
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        //노티피케이션 센터에 추가
                        UNUserNotificationCenter.current().add(request) { (_) in
                            DispatchQueue.main.async {
                                //발송 완료 안내 메세지 창
                                let date = self.datePicker.date.addingTimeInterval(9*60*60)
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
                                let message = "알림이 등록되었습니다. 등록된 알림은 \(formatter.string(from: date))에 발송됩니다"
                                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default)
                                alert.addAction(ok)
                                
                                self.present(alert, animated: false)
                            }
                        }
                    }
                } else {
                    let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되지 않습니다", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    return
                }
            }
        } else { //LocalNotification 객체를 사용한 로컬 알림
        }
        
    }
    
}

