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
        ("다크나이드","영웅물에 철학에 음악까지 더해져 예술이 되다.","2008-09-04",8.95),
        ("호우시절","때를 알고 내리는 좋은 비","2009-10-08",7.31),
        ("말할 수 없는 비밀","여기서 너까지 다섯 걸음","2015-05-07",9.19)
    ]
    
    // 테니블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVo] = {
        var datalist = [MovieVo]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVo()
            mvo.title = title
            mvo.desctiption = desc
            mvo.opendate = opendate
            mvo.rating = rating

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        // 영화제목이 표시될 레이블을 title 변수로 받음
        let title = cell.viewWithTag(101) as? UILabel
        // 영화요약이 표시될 레이블을 desc 변수로 받음
        let desc = cell.viewWithTag(102) as? UILabel
        // 영화 개봉일이 표시될 레이블을 opendate 변수로 받음
        let opendate = cell.viewWithTag(103) as? UILabel
        // 영화 별정이 표시될 레이블을 rating 변수로 받음
        let rating = cell.viewWithTag(104) as? UILabel
        //데이터 소스에 저장된 값을 각 레이블 변수에 할당
        title?.text = row.title
        desc?.text = row.desctiption
        opendate?.text = row.opendate
        rating?.text = "\(row.rating!)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
