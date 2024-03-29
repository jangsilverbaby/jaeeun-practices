//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by eunae on 2021/07/19.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var title: UILabel! // 영화제목
    @IBOutlet var opendate: UILabel! // 개봉일
    @IBOutlet var rating: UILabel! // 평점
    @IBOutlet var desc: UILabel! // 영화 설명
    @IBOutlet var thumbnail: UIImageView! // 섬네일 이미지
}
