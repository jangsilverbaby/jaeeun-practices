//
//  ViewController.swift
//  APITest
//
//  Created by eunae on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTime: UILabel!
    /* POST Echo API 호출 관련*/
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var responseView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callCurrentTime(_ sender: Any) {
        do {
            // 1. URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            // 2. 읽어온 값을 레이블에 표시
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)" // POST 방식으로 전송할 때에는 HTTP 통신 표준 프로토콜에 정의된 약속에 따라, key1=value1&key2=value2&...와 같은 형식으로 작성해 주어야 함.
        let paramData = param.data(using: .utf8) // 공백이나 문장부호, 한글 등의 일부 문자가 전송과정에서 변형되지 않는 표현 형식으로 인코딩 -> URL 인코딩
         
        // 2. URL 객체 정의, API를 호출하는 과정은 대부분 URL 객체를 생성하는 것으로 시작, 이를 이용하여 URLRequest 객체를 생성할 수 있기 때문
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        var request = URLRequest(url: url!)
        request.httpMethod = "POST" // 전송 방식
        request.httpBody = paramData // 전송할 메세지 본문 내용
        
        // 4. HTTP 메세지 헤더 설정, 실제 내용에는 포함되지 않으면서 전송하는 콘텐츠에 대한 형식이나 특성 등 메타 정보를 제종하는 역할
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length") // 전송할 메세지 본문의 길이
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            // 5-2. 응답 처리 로직이 여기에 들어갑니다.
            // 1) 메인 스레드에서 비동기로 처리되도록 한다.
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // 2) JSON 결과값을 추출한다.
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!)\n" + "이름 : \(name!)\n" + "응답결과 : \(result!)\n" + "응답시간 : \(timestamp!)\n" + "요청방식 : x-www-form-urlencoded\n"
                        
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            } // end if DispatchQueue.main.async()
        }
        // 6. POST 전송, 서버로 전송하여 API 호출
        task.resume()
    }
    
    @IBAction func json(_ sender: Any) {
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = ["userId" : userId, "name": name] // JSON 객체로 변활할 딕셔너리 준비
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echoJSON")
        
        // 3. URLRequest 객체를 정의하고, 요청 내용을 담는다.
        var request = URLRequest(url: url!)
        request.httpMethod = "POST" // 전송 방식
        request.httpBody = paramData // 전송할 메세지 본문 내용
        
        // 4. HTTP 메세지에 포함될 헤더 설정
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            // 5-2. 응답 처리 로직이 여기에 들어갑니다.
            // 1) 메인 스레드에서 비동기로 처리되도록 한다.
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // 2) JSON 결과값을 추출한다.
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    // 3) 결과가 성공일 때에만 텍스트 뷰에 출력한다.
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!)\n" + "이름 : \(name!)\n" + "응답결과 : \(result!)\n" + "응답시간 : \(timestamp!)\n" + "요청방식 : x-www-form-urlencoded\n"
                        
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            } // end if DispatchQueue.main.async()
        }
        // 6. POST 전송, 서버로 전송하여 API 호출
        task.resume()
    }
}

