//
//  ListVC.swift
//  CoreData-Practice
//
//  Created by eunae on 2021/10/28.
//

import UIKit
import CoreData

class ListVC : UITableViewController {
    // 데이터 소스 역할을 할 배열 변수
    lazy var list: [NSManagedObject] = {
        return self.fetch()
    }()
    
    // 데이터를 읽어올 메소드, 코어 데이터에서 레코드를 읽어오는 과정을 보통 페치라는 단어로 표현(=데이터 가져오기)
    func fetch() -> [NSManagedObject] {
        // 1. 앱 델리게이트 객체 참조
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 2. 관리 객체 컨텍스트 참조
        let context = appDelegate.persistentContainer.viewContext
        // 3. 요청 객체 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Board") // SELECT 쿼리문과 유사한 역할
        // 4. 데이터 가져오기
        let result = try! context.fetch(fetchRequest)
        return result
    }
    
    // 테이블 뷰 데이터 소스용 프로토콜 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 해당하는 데이터 가져오기
        let record = self.list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let contents = record.value(forKey: "contents") as? String
        
        // 셀을 생성하고 값은 대입한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = contents
        
        return cell
    }
}
