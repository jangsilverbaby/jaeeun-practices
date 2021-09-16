//
//  ListViewController.swift
//  CustomPlist
//
//  Created by eunae on 2021/09/15.
//

import UIKit

class ListViewController : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var account: UITextField! // 계정
    @IBOutlet weak var name: UILabel! // 이름
    @IBOutlet weak var gender: UISegmentedControl! // 성별
    @IBOutlet weak var married: UISwitch! //결혼 여부
    
    var accountlist = [String]()
    
    override func viewDidLoad() {
        let picker = UIPickerView()
        
        // 1. 피커 뷰의 델리게이트 객체 지정
        picker.delegate = self
        // 2. account 텍스트 필드 입력 방식을 가상 키보드 대신 피커 뷰로 설정
        self.account.inputView = picker
        
        // 툴 바 객체 정의
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 36)
        toolbar.barTintColor = .lightGray
        
        // 액세서리 뷰 영역에 툴바를 표시
        self.account.inputAccessoryView = toolbar
        
        // 툴 바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        // 가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 신규 계정 등록 버튼
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(newAccount(_:))
        
        // 버튼을 툴 바에 추가
        toolbar.setItems([new, flexSpace, done], animated: true)
        
        // 기본 저장소 객체 불러오기
        let plist = UserDefaults.standard
        
        // 불러온 값을 설정
        self.name.text = plist.string(forKey: "name") // 이름
        self.married.isOn = plist.bool(forKey: "married") // 결혼 여부
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender") // 성별
        
        let accountlist = plist.array(forKey: "accountlist") as? [String] ?? [String]()
        self.accountlist = accountlist
        
        // 1. "selectedAccount" 키에 저장된 값이 있으면, 이를 사용하여 읽어와야 할 파일의 이름을 구성한다.
        if let account = plist.string(forKey: "selectedAccount") {
            self.account.text = account
            let customPlist = "\(account).plist" // 읽어올 파일명
            // 2. 앱 내에 저장된 문서 디렉터리 경로를 가져온 다음, 파일명을 조합하여 전체 경로를 구성한다.
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let path = paths[0] as NSString
            let clist = path.strings(byAppendingPaths: [customPlist]).first!
            // 3. 지정된 파일을 읽어와서 딕셔너리 객체로 전환한다.
            let data = NSDictionary(contentsOfFile: clist)
            // 4. "name" 키에 저장된 값을 꺼내어 이름 레이블에 세팅한다.
            self.name.text = data?["name"] as? String
            // 5. "gender" 키에 저장된 값을 꺼내어 세그먼트 컨트롤에 세팅한다. 만약 값이 없다면 0으로 설정한다.
            self.gender.selectedSegmentIndex = data?["gender"] as? Int ?? 0
            // 6. "married" 키에 저장된 값을 꺼내어 스위치 컨트롤에 세팅한다. 만약 값이 없다면 false로 설정한다.
            self.married.isOn = data?["married"] as? Bool ?? false
        }
    }
    
    // 생성할 컴포넌트의 개수를 정의합니다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 지정된 컴포넌트가 가질 목록의 길이를 정의합니다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountlist.count
    }
    
    // 지정된 컴포넌트의 목록 각 행에 출력될 내용을 정의합니다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountlist[row]
    }
    
    // 지정된 컴포넌트의 목록 각 행을 사용자가 선택했을 때 실행할 액션을 정의합니다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 1. 선택된 계정값을 텍스트 필드에 입력
        let account = self.accountlist[row] // 선택된 계정
        self.account.text = account
        
        // 사용자가 계정을 생성하면 이 계정을 선택한 것으로 간주하고 저정
        let plist = UserDefaults.standard
        plist.set(account, forKey: "selectedAccount")
        plist.synchronize()
    }
    
    @objc func pickerDone(_ sender: Any) {
        // 2. 입력 뷰를 닫음
        self.view.endEditing(true)
        
        if let _account = self.account.text {
            let customPlist = "\(_account).plist" // 읽어올 파일명
           
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let path = paths[0] as NSString
            let clist = path.strings(byAppendingPaths: [customPlist]).first!
            let data = NSDictionary(contentsOfFile: clist)
            self.name.text = data?["name"] as? String
            self.gender.selectedSegmentIndex = data?["gender"] as? Int ?? 0
            self.married.isOn = data?["married"] as? Bool ?? false
        }
    }
    
    @objc func newAccount(_ sender: Any) {
        self.view.endEditing(true) // 일단 열려있는 입역용 뷰부터 닫아준다.
        
        // 알림창에 객체 생성
        let alert = UIAlertController(title: "새 계정을 입력하세요", message: nil, preferredStyle: .alert)
        
        // 입력폼 추가
        alert.addTextField() {
            $0.placeholder = "ex) abc@gmail.com"
        }
        
        // 버튼 및 액션 정의
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            if let account = alert.textFields?[0].text {
                // 계정 목록 배열에 추가한다.
                self.accountlist.append(account)
                // 계정 텍스트 필드에 표시한다.
                self.account.text = account
                
                // 컨트롤 값을 모두 초기화한다.
                self.name.text = ""
                self.gender.selectedSegmentIndex = 0
                self.married.isOn = false
                
                // 계정 목록을 통쨰로 저장한다.
                let plist = UserDefaults.standard
                
                plist.set(self.accountlist, forKey: "accountlist")
                plist.set(account, forKey: "seletedAccount")
                plist.synchronize()
            }
        })
        // 알림창 오픈
        self.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0이면 남자, 1이면 여자
        
        // 저장 로직 시작
         let customPlist = "\(self.account.text!).plist" // 읽어올 파일명
         
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
         let path = paths[0] as NSString
         let plist = path.strings(byAppendingPaths: [customPlist]).first!
         let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
         
         data.setValue(value, forKey: "gender")
         data.write(toFile: plist, atomically: true)
        
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
         let value = sender.isOn // true이면 기혼, false면 미혼
         // 저장 로직 시작
         let customPlist = "\(self.account.text!).plist" // 읽어올 파일명
         
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
         let path = paths[0] as NSString
         let plist = path.strings(byAppendingPaths: [customPlist]).first!
         let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
         
         data.setValue(value, forKey: "married")
         data.write(toFile: plist, atomically: true)
        
        print("custom plist=\(plist)")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 { // 두 번째 섹이 클릭되었을 때에만
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            // 입력 필드 추가
            alert.addTextField() {
                $0.text = self.name.text // name 레이블의 텍스트를 입력폼에 기본값으로 넣어준다.
            }
            
            // 버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                // 사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장한다.
                let value = alert.textFields?[0].text
                
               // 저장 로직 시작
                let customPlist = "\(self.account.text!).plist" // 읽어올 파일명
                
                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let path = paths[0] as NSString
                let plist = path.strings(byAppendingPaths: [customPlist]).first!
                let data = NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary()
                
                data.setValue(value, forKey: "name")
                data.write(toFile: plist, atomically: true)
                
                self.name.text = value
            })
            // 알림창 띄움
            self.present(alert, animated: false, completion: nil)
        }
    }
}
