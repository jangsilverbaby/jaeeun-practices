//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by eunae on 2021/05/25.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        // 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: false)
    }
    
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기 <- 가장 먼저 해주어야할 일
        self.dismiss(animated: false, completion: {() in
            // 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        })
        // 피커 컨트롤러와 알림창은 모두 ViewController에서 실행하는 컨트롤러이기 떄문에 화면에 표시되기 위해 서로 경합을 할 수밖에 없는데, 만약 이미지 피터 컨트롤러가 조금 늦게 닫히고 그동안 알림창 구문이 호출될 경우 알림창이 실행되지 않는 버스가 생길 수 있기 때문에 dismiss 메소드를 사용하여 이미지 피커 컨트롤러 창이 완전히 닫힌 후에 다음 로직을 실행할 수 있도록 수정
        
    }
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false) {() in // picker 인스턴스에서 메소드를 호출한 것은 내부적으로 알아서 self.presentingViewController 쪽으로 연결시켜주기 때문
            // 이미지를 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

