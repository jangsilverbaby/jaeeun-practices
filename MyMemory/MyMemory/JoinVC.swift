//
//  JoinVC.swift
//  MyMemory
//
//  Created by eunae on 2021/11/22.
//

import UIKit
import Alamofire

class JoinVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // 테이블 뷰에 들어갈 텍스트 필드들
    var fieldAccount: UITextField! // 계정 필드
    var fieldPassword: UITextField! // 비밀번호 필드
    var fieldName: UITextField! // 이름 필드
    
    override func viewDidLoad() {
        // 테이블 뷰의 dataSource, delegate 속성 지정
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 프로필 이미지를 원형으로 설정
        self.profile.layer.cornerRadius = self.profile.frame.width / 2
        self.profile.layer.masksToBounds = true
        
        // 프로필 이미지에 탭 제스처 및 액션 이벤트 설정
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedProfile(_:)))
        self.profile.addGestureRecognizer(gesture)
    }
    
    @objc func tappedProfile(_ sender: Any) {
        // 전반부) 원하는 소스 타입을 선택할 수 있는 액션 시트 구현
        let msg = "프로필 이미지를 읽어올 곳을 선택하세요."
        let sheet = UIAlertController(title: msg, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        sheet.addAction(UIAlertAction(title: "저장된 앨범", style: .default) { (_) in
            selectLibrary(src: .savedPhotosAlbum) // 저장된 앨범에서 이미지 선택하기
        })
        sheet.addAction(UIAlertAction(title: "포토 라이브러리", style: .default) { (_) in
            selectLibrary(src: .photoLibrary) // 포토 라이브러리에서 이미지 선택하기
        })
        sheet.addAction(UIAlertAction(title: "카메라", style: .default) { (_) in
            selectLibrary(src: .camera) // 카메라에서 이미지 촬영하기
        })
        self.present(sheet, animated: false)
        
        // 후반부) 전달된 소스 타입에 맞게 이미지 피커 창을 여낸 내부 함수
        func selectLibrary(src: UIImagePickerController.SourceType) {
            if UIImagePickerController.isSourceTypeAvailable(src) {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                self.present(picker, animated: false)
            } else {
                self.alert("사용할 수 없는 타입입니다.")
            }
        }
    }
    
    // 이미지 선택 시 실행되는 델리게이트 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let rawVal = UIImagePickerController.InfoKey.originalImage.rawValue
        if let img = info[UIImagePickerController.InfoKey(rawValue: rawVal)] as? UIImage {
            self.profile.image = img
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func submit(_sender: Any) {
        // 1. 전달할 값 준비
        // 1-1. 이미지를 Base64 인코딩 처리
        let profile = self.profile.image!.pngData()?.base64EncodedString()
        // 1-2. 전달값을 Parameters 타입의 객체로 정의
        let param: Parameters = [
            "account" : self.fieldAccount.text!,
            "passwd" : self.fieldPassword.text!,
            "name" : self.fieldName.text!,
            "profile_image" : profile!
        ]
        
        // 2. API 호출
        let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/join"
        let call = AF.request(url, method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default)
        
        // 3. 서버 응답값 처리
        call.responseJSON { res in
            // 3-1. JSON 형식으로 값이 제대로 전달되었는지 확인
            guard let jsonObject = try! res.result.get() as? [String: Any] else {
                self.alert("서버 호출 과정에사 오류가 발생했습니다.")
                return
            }
            // 3-2. 응답 코드 확인. 0이면 성공
            let resultCode = jsonObject["result_code"] as! Int
            if resultCode == 0 {
                self.alert("가입이 완료되었습니다.")
            } else { // 3-4. 응답 코드가 0이 아닐 때에는 실패
                let errorMsg = jsonObject["error_msg"] as! String
                self.alert("오류발생 : \(errorMsg)")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        // 각 테이블 뷰 셀 모두에 공통으로 적용될 프레임 객체
        let tfFrame = CGRect(x: 20, y: 0, width: cell.bounds.width, height: 37)
        switch indexPath.row {
        case 0:
            self.fieldAccount = UITextField(frame: tfFrame)
            self.fieldAccount.placeholder = "계정(이메일)"
            self.fieldAccount.borderStyle = .none
            self.fieldAccount.autocapitalizationType = .none
            self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldAccount)
        case 1:
            self.fieldPassword = UITextField(frame: tfFrame)
            self.fieldPassword.placeholder = "비밀번호"
            self.fieldPassword.borderStyle = .none
            self.fieldPassword.isSecureTextEntry = true
            self.fieldPassword.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldPassword)
        case 2:
            self.fieldName = UITextField(frame: tfFrame)
            self.fieldName.placeholder = "이름"
            self.fieldName.borderStyle = .none
            self.fieldName.font = UIFont.systemFont(ofSize: 14)
            cell.addSubview(self.fieldName)
        default:
            ()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
