//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by eunae on 2021/08/12.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    var subject: String!
    
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    override func viewDidLoad() {
        self.contents.delegate = self
        
        // 배경 이미지 설정
        let bgImage = UIImage(named: "memo-background.png")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        // 텍스트 뷰의 기본 속성
        self.contents.layer.borderWidth = 0 // 테두리 제거
        self.contents.layer.borderColor = UIColor.clear.cgColor // 색상 제거
        self.contents.backgroundColor = UIColor.clear // 색상 제거
        
        // 줄 간격
        let style = NSMutableParagraphStyle() // 문단 스타일을 정하는 클래스, 파운데이션 프레임 워크에 정의 돼있음
        style.lineSpacing = 9 // 줄 간격을 설정하는 속성
        self.contents.attributedText = NSAttributedString(string: " ", attributes: [.paragraphStyle: style]) // 텍스트 뷰의 attributedText 속성에 NSAttributeString 객체의 속성 형태로 변환하여 대입하면 텍스트 뷰의 중 간격이 설정된다.
        self.contents.text = ""
        
    }
    
    // 사용자가 텍스트 뷰에 뭔가를 입력하면 자동으로 이 메소드가 호출된다
    func textViewDidChange(_ textView: UITextView) {
        // 내용의 최대 15자리까지 읽어 subject 변수에 저장한다.
        // 1. 텍스트 뷰의 내용을 읽어 NSString 타입으로 캐스팅한 다음, 변수에 저장한다.
        let contents = textView.text as NSString
        // 2. 읽어온 내용이 15자리보다 길 경우 15자리까지만, 그보다 짧을 경우 전체 내용을 읽어온다.
        let length = ((contents.length > 15) ? 15 : contents.length)
        // 3. 최대 15자리까지의 내용을 subject 변수에 저장한다. 이 값이 제목이 된다.
        subject = contents.substring(with: NSRange(location: 0, length: length))
        
        // 4. 내비게이션 타이틀에 표시한다.
        navigationItem.title = subject
    }
    
    // 저장 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func save(_ sender: Any) {
        // 1. 내용을 입력하지 않았을 경우, 경고한다.
        guard contents.text?.isEmpty == false else {
            // 내용이 비어 있을 때 처리
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        // 2. MemoData 객체를 생성하고, 데이터를 담는다.
        let data = MemoData()
        
        data.title = subject // 제목
        data.contents = contents.text // 내용
        data.image = preview.image // 이미지
        data.regdate = Date() // 작성 시각
        
        // 3. 앱 델리게이트 객체를 읽어온 다음, memolist 배열에 MemoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 4. 작성폼 화면을 종료하고, 이전 화면으로 되돌아간다.
        _ = navigationController?.popViewController(animated: true)
    }
    
    // 카메라 버튼은 클릭했을 때 호출되는 메소드
    @IBAction func pick(_ sender: Any) {
        // 1. 이미지 피커 인스턴스를 생성한다.
        let picker = UIImagePickerController()
        // 2. 이미지 피커 컨트롤러 인스턴스의 델리게이트 속성을 현재의 뷰 컨트롤러 인스턴스로 설정한다.
        picker.delegate = self
        // 3. 이미지 피커 컨트롤러의 이미지 편집을 허용한다.
        picker.allowsEditing = true
        
        // 4. 이미지 피커 화면을 표시한다.
        present(picker, animated: false)
    }
    
    // 사용자가 이미지를 선택하면 자동으로 이 메소드가 호출된다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택된 이미지를 미리보기에 출력한다.
        preview.image = info[.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
    }
}
