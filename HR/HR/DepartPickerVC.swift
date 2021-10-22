//
//  DepartPickerVC.swift
//  HR
//
//  Created by eunae on 2021/10/22.
//

import UIKit

class DepartPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // 멤버 변수와 메소드가 작성될 영역
    let departDAO = DepartmentDAO() // DAO 객체
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]! // 피커뷰의 데이터 소스
    var pickerView: UIPickerView! // 피커뷰 객체
    
    // 현재 피커 뷰에 선택되어 있는 부서의 코드를 가져온다.
    var selectedDepartCd: Int {
        let row = self.pickerView.selectedRow(inComponent: 0)
        return self.departList[row].departCd
    }
    
    override func viewDidLoad() {
        // 1. DB에서 보서 목록을 가져와 튜플 배열을 초기화한다.
        self.departList = self.departDAO.find()
        
        // 2. 피커 뷰 객체를 초기화하고, 최상위 뷰의 서브 뷰로 추가한다.
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.view.addSubview(self.pickerView)
        
        // 3. 외부에서 뷰 컨트롤러를 참조할 때를 위한 사이즈를 지정한다.
        let pWidth = self.pickerView.frame.width
        let pHeight = self.pickerView.frame.height
        self.preferredContentSize = CGSize(width: pWidth, height: pHeight)
    }
    
    // 피커 뷰에 표시될 전체 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 특정 컴포넌트의 행 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.departList.count
    }
    
    // 피커 뷰의 각 행에 표시될 뷰를 결정하는 메소드
    // 이 메소드는 문자열 대신 뷰(View) 객체를 반환하기 때문에, 원하는 형태로 레이아웃과 속성을 설정할 수 있다.
    // 반환값은 뷰의 하위 클래스가 될 수 있는 것이라면 무엇이든 가능
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var titleView = view as? UILabel
        if titleView == nil {
            titleView = UILabel()
            titleView?.font = UIFont.systemFont(ofSize: 14)
            titleView?.textAlignment = .center
        }
        
        titleView?.text = "\(self.departList[row].departTitle)(\(self.departList[row].departAddr))"
        return titleView!
    }
}
