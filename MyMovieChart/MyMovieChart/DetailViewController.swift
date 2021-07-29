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
        
        // URLRequest 인스턴스를 생성한다.
        let url = URL(string: (mvo.detail)!)
        let req = URLRequest(url: url!)
        
        //loadRequest 메소드를 호출함녀서 rep를 인자값으로 전달한다.
        wv.load(req)
    }
}
