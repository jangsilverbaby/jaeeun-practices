//
//  MemoData.swift
//  MyMemory
//
//  Created by eunae on 2021/08/12.
//

import UIKit
import CoreData

class MemoData {
    var memoIdx : Int? // 데이터 식별값
    var title : String? // 메모 제목
    var contents : String? // 메모 내용
    var image : UIImage? // 이미지
    var regdate : Date? // 작성일
    var objectID: NSManagedObjectID? // 원본 MomoMO 객체를 참조하기 위한 속성
}
