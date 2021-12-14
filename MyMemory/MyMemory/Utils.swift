//
//  Utils.swift
//  MyMemory
//
//  Created by eunae on 2021/09/22.
//

import UIKit
import Security
import Alamofire

class TokenUtils {
    // 키 체인에 값을 저장하는 메소드
    func save(_ service: String, account: String, value: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecValueData : value.data(using: .utf8, allowLossyConversion: false)!
        ]
        
        // 현재 저장되어 있는 값 삭제
        SecItemDelete(keyChainQuery)
        
        // 새로운 키 체인 아이템 등록
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "토큰 값 저장에 실패했습니다.")
        NSLog("status=\(status)")
    }
    
    // 키 체인에 저장된 값을 읽어오는 메소드
    func load(_ service: String, account: String) -> String? {
        // 1. 키 체인 쿼리 정의
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecReturnData : kCFBooleanTrue!, // CFDataRef
            kSecMatchLimit : kSecMatchLimitOne
        ]
        
        // 2. 키 체인에 저장된 값을 읽어온다.
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        // 3. 처리 결과가 성공이라면 읽어온값을 Data 타입으로 변환하고, 다시 String 타입으로 변환한다.
        if (status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: String.Encoding.utf8)
            return value
        } else { // 4. 처리 결과가 실패라면 nil을 반환한다.
            print("Nothing was retrieved from the keychain. Status code \(status)")
            return nil
        }
    }
    
    // 키 체인에 저장된 값을 삭제하는 메소드
    func delete(_ service: String, account: String) {
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account
        ]
        
        // 현재 저장되어 있는 값 삭제
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr, "토큰 값 삭제에 실패했습니다.")
        NSLog("status=\(status)")
    }
    
    // 키 체인에 저장된 액세스 토큰을 이용하여 헤더를 만들어주는 메소드
    func getAuthorizationHeader() -> HTTPHeaders? {
        let serviceID = "kr.co.rubypaper.MyMemory"
        if let accessToken = self.load(serviceID, account: "accessToken") {
            return ["Authorization" : "Bearer \(accessToken)"] as HTTPHeaders
        } else {
            return nil
        }
    }
}

// 익스텐션(extension): 원래의 클래스를 수정하거나 편집하지 않고도 원하는 임의의 프로퍼티나 메소드를 추가할 수 있는 스위프트 문법, 저장 프로퍼티를 정의할 수 없으며, 기존 메소드의 오버라이딩도 지원하지 않음
extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
    
    func alert(_ message: String, completion: (()->Void)? = nil) {
        // 메인 스레드에서 실행되도록
        // URLSession 객체는 비동기 방식으로 동작함녀서 종종 응답 결과 처리를 서브 스레드에 맡기기 때문에 해당 메소드가 서브 스레드에서 호출될 경우를 방지하기 위해 알림창을 실행하는 구문이 메인 큐에서 처리되도록 블록으롬 감쌈
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                completion?() // completion 매개변수의 값이 nil이 아닐 때에만 실행되도록
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
}
