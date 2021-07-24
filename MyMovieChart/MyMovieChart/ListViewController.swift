//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by eunae on 2021/05/29.
//

import UIKit

class ListViewController: UITableViewController {
    // 현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVo] = {
        var datalist = [MovieVo]()
        return datalist
    }()
    
    @IBOutlet var moreBnt: UIButton!
    
    // 더보기 버튼을 눌렀을 때 호출되는 메소드
    @IBAction func more(_ sender: Any) {
        // 현재 페이지 값에 1을 추가한다.
        page += 1
        // 영화 차트 API를 호출한다.
        callMovieAPI()
        // 데이터를 다시 읽어오도록 테이블 뷰를 갱신한다.
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        callMovieAPI()
    }
    
    // 영화 차트 API를 호출해주는 메소드
    func callMovieAPI() {
        // 1. 호핀 API 호출을 위한 URI를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(page)&count=30&genreId=&order=releasedateasc"
        let apiURI : URL! = URL(string: url)
        
        // 2. REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3. 데이터 전송 결과를 로그로 출력 (반드시 필요한 코드는 아님)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
        NSLog("API Result=\( log )")
        
        // 4. JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 5. 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // 6. Iterator 처리를 하면서 API 데이터를 MovieVo 객체에 저장한다.
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVo()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.desctiption = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // list 배열에 추가
                list.append(mvo)
            }
            
            // 7. 전체 데이터 카운트를 얻는다.
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            
            // 8. totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다.
            if (list.count >= totalCount) {
                moreBnt.isHidden = true
            }
        } catch {
            NSLog("Parse Error!!")
        }
    }
    
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
        
       //섬네일 결로를 인자값으로 하는 URL 객체를 생성
        let url : URL! = URL(string: row.thumbnail!)
        
        //이지미를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        //UIImage 객체를 생성하여 아울렛 변수의 image 속성에 대입
        cell.thumbnail.image = UIImage(data: imageData)
        
        //->실무에선 한줄로 코딩함
        //cell.thumbnail.image = UIImage(data: try! Data(contentsOf: URL(string: row.thumbnail!)!)
        
        //구성될 셀을 반환함
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
