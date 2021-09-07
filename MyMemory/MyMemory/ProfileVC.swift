//
//  ProfileVC.swift
//  MyMemory
//
//  Created by eunae on 2021/09/07.
//

import UIKit

// UITableViewDelegate : 테이블 뷰에서 살생한느 사용자 액션에 응답하기 위한 프로토콜
// UITableViewDataSource : 데이터 소스를 이용하여 테이블 뷰를 구성하기 위해 필요한 프로토콜
class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let profileImage = UIImageView() // 프로필 사진 이미지
    let tv = UITableView() // 프로필 목록
    
    override func viewDidLoad() {
        self.navigationItem.title = "프로필"
        
        // 뒤로 가기 버튼 처리
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // 여기에 셀 구현 내용이 들어갈 예정입니다.
        return cell
    }
    
    @objc func close(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
        
}
