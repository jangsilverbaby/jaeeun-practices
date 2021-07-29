//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by eunae on 2021/07/29.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVo! // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    override func viewDidLoad() {
        NSLog("linkrul = \(mvo.detail!), title=\(mvo.title!)")
        
        // 내비게이션 바의 타이틀에 영화명을 출력한다.
        let navibar = navigationItem
        navibar.title = mvo.title
        
        if let url = mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                wv.load(req)
            } else { // URL 형식이 잘못되었을 경우에 대한 예외처리
                // 경고창 형식으로 오류 메세지를 표시해준다.
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다", preferredStyle: .alert)
                let cancelAtion = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    // 이전 페이지로 되돌려보낸다.
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancelAtion)
                present(alert, animated: false, completion: nil)
            }
        } else { // URL 값이 전달되지 않았을 경우에 대한 예외처리
            // 경고창 형식으로 오류 메세지를 표시해준다.
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .alert)
            let cancelAtion = UIAlertAction(title: "확인", style: .cancel) { (_) in
                // 이전 페이지로 되돌려보낸다.
                _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancelAtion)
            present(alert, animated: false, completion: nil)
        }
    }
}
