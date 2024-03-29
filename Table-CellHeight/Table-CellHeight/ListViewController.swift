//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by eunae on 2021/07/20.
//

import UIKit

class ListViewContoller: UITableViewController {
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
    @IBAction func add(_ sender: Any) {
        // 1. 알림창 객체의 인스턴스를 생성한다.
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        // 2. 알림창에 입력폼을 추가한다.
        alert.addTextField() { (tf) in
            tf.placeholder = "내용을 입력하세요"
        }
        // 3. OK 버튼 객체를 생성한다: 아직 알림창 객체 버튼이 등록되지 않은 상태
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            // 4. 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                // 5. 배열에 입력된 값을 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        // 최소 버튼 객체를 생성한다: 아직 알림창 객체에 버튼이 등록되지 않은 상태
        let cancle = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 6. 알림창 객체에 버튼 객체를 등록한다.
        alert.addAction(ok)
        alert.addAction(cancle)
        
        // 7. 알림창을 띄운다.
        present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. "cell" 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        // 셸의 기본 텍스트 레이블에 배열 변수의 값을 할당한다.
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 50 // 대충의 높이값
        tableView.rowHeight = UITableView.automaticDimension
    }
}
