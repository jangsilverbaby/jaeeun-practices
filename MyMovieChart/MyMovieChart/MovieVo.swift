//
//  MovieVo.swift
//  MyMovieChart
//
//  Created by eunae on 2021/07/14.
//

import Foundation
import UIKit

class MovieVo {
    var thumbnail: String? // 영화 섬네일 이미지 주소
    var title: String? // 영화 제목
    var desctiption: String? // 영화 설명
    var detail: String? // 상세정보
    var opendate: String? // 개봉일
    var rating: Double? // 평점
    
    // 영화 썸네일 이미지를 담을 UIImage 객체를 추가한다.
    var thumbnailImage: UIImage?
}
