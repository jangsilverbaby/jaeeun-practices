//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by eunae on 2021/05/29.
//

import UIKit

class ListViewController: UITableViewController {
    // 테이블 뷰를 구성할 리스트 데이터
    var list = [MovieVo]()
    
    override func viewDidLoad() {
        // 첫번째 행
        var mvo = MovieVo()
        mvo.title = "다크나이드"
        mvo.desctiption = "영웅물에 철학에 음악까지 더해져 예술이 되다."
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        // 배열에 추가
        self.list.append(mvo)
        
        // 두번째 행
        mvo = MovieVo()
        mvo.title = "호우시절"
        mvo.desctiption = "떄룰 알고 내리는 좋은 비"
        mvo.opendate = "2009-10-08"
        mvo.rating = 7.31
        // 배열에 추가
        self.list.append(mvo)
        
        // 세번째 행
        mvo = MovieVo()
        mvo.title = "말할 수 없는 비밀"
        mvo.desctiption = "여기서 너까지 다섯 걸음"
        mvo.opendate = "2015-05-07"
        mvo.rating = 9.19
        // 배열에 추가
        self.list.append(mvo)
    }
}
