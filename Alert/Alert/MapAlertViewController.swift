//
//  MapAlertViewController.swift
//  Alert
//
//  Created by eunae on 2021/08/26.
//

import UIKit
import MapKit // 맵킷 프레임워크 반입 구문

class MapAlertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 생성
        let alertBtn = UIButton(type: .system)
        
        // 버튼 속성 설정
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        // 이미지 알림창 버튼 생성
        let imageBtn = UIButton(type: .system)
        
        // 이미지 알림창 버튼 속성 설정
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
        
        // 슬라이더 알림창 버튼 생성
        let sliderBtn = UIButton(type: .system)
        
        // 이미지 알림창 버튼 속성 설정
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(sliderBtn)
        
        // 테이블 뷰 알림창 버튼 생성
        let listBtn = UIButton(type: .system)
        
        // 이미지 알림창 버튼 속성 설정
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.frame.width / 2
        listBtn.setTitle("List Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(listBtn)
        
    }
    
    @objc func mapAlert(_ sender: UIButton) {
        // 경고창 객체를 생성하고, OK 및 Cancle 버튼을 추가한다.
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다.
        let contentVC = MapKitViewController()
         
        // 뷰 컨트롤러를 알림창의 콘텐츠 뷰 컨트롤러 속성에 등록한다.
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @objc func imageAlert(_ sender: Any) {
        // 경고창 객체를 생성하고, OK 및 Cancle 버튼을 추가한다.
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다.
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @objc func sliderAlert(_ sender: Any) {
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성
        let contentVC = ControlViewController()
        
        // 경고창 객체를 생성
        let alert = UIAlertController(title: nil, message: "이번 글의 평점을 입력해주세요.", preferredStyle: .alert)
        
        // 컨트롤 뷰 컨트롤러를 알림창에 등록한다.
        alert.setValue(contentVC, forKey: "contentViewController")
        
        // OK 버튼을 추가한다.
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print(">>> sliderValue = \(contentVC.sliderValue)")
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
    @objc func listAlert(_ sender: Any) {
        // 콘텐츠 뷰 영역에 들어갈 뷰 컨트롤러 생성
        let contentVC = ListViewController()
        
        // 델리게이트 객체를 자신으로 지정한다.
        contentVC.delegate = self
        
        // 경고창 객체를 생성
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        // 컨트롤 뷰 컨트롤러를 알림창에 등록한다.
        alert.setValue(contentVC, forKey: "contentViewController")
        
        // OK 버튼을 추가한다.
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: false)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(">>> 선택된 행은 \(indexPath.row )입니다")
    }
}
