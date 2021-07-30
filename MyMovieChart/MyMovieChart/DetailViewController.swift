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
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVo! // 목록 화면에서 전달하는 영화 정보를 받을 변수
    
    override func viewDidLoad() {
        NSLog("linkrul = \(mvo.detail!), title=\(mvo.title!)")
        
        // WKNavigationDelegate의 델리게이트 객체를 지정
        wv.navigationDelegate = self
        
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

//MARK:- WKNavigationDelegate 구현
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        spinner.startAnimating() // 인디케이터 뷰의 애니메이션을 실행
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중지
        
        // 경고창 형식으로 오류 메세지를 표시해준다.
        let alert = UIAlertController(title: "오류", message: "상세페이지를 읽어오지 못했습니다.", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
            // 이전 화면으로 되돌려 보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancleAction)
        present(alert, animated: false, completion: nil)
    }
}
