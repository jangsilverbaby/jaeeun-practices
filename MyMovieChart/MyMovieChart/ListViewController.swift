//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by eunae on 2021/05/29.
//

import UIKit

class ListViewController: UITableViewController {
    // 튜플 아이템으로 구성된 데이터 세트
    var dataset = [
        ("다크나이드","영웅물에 철학에 음악까지 더해져 예술이 되다.","2008-09-04",8.95,"darknight.jpg"),
        ("호우시절","때를 알고 내리는 좋은 비","2009-10-08",7.31,"rain.jpg"),
        ("말할 수 없는 비밀","여기서 너까지 다섯 걸음","2015-05-07",9.19,"secret.jpg")
    ]
    
    // 테니블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVo] = {
        var datalist = [MovieVo]()
        for (title, desc, opendate, rating, thumbnail) in dataset {
            let mvo = MovieVo()
            mvo.title = title
            mvo.desctiption = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = list[indexPath.row]
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        //데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.desctiption
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        //이미지 뷰 처리
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        //구성될 셀을 반환함
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
