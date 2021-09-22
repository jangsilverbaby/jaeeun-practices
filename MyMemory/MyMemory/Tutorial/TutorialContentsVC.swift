//
//  TutorialContentsVC.swift
//  MyMemory
//
//  Created by eunae on 2021/09/22.
//

import UIKit

class TutorialContentVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    var pageIndex: Int! // 순번 구분을 위한 페이지 인텍스 정보
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        // 이미지를 꽉 채울 수 있게
        self.bgImageView.contentMode = .scaleAspectFill
        
        // 전달받은 타이틀 정보를 레이블 객체에 대이ㅂ하고 크기를 조정한다.
        self.titleLabel.text = self.titleText
        self.titleLabel.sizeToFit()
        
        // 전달받은 이미지 정보를 이미지 뷰에 대입한다.
        self.bgImageView.image = UIImage(named: self.imageFile)
    }
}
