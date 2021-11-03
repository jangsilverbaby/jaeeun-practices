//
//  ViewController.swift
//  APITest
//
//  Created by eunae on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTime: UILabel!
    
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
    
}

