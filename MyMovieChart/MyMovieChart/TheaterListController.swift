//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by eunae on 2021/08/05.
//


import UIKit
class TheaterListController: UITableViewController {
    // API를 통해 불러온 데이터를 저장할 배열 변수
    var list = [NSDictionary]()
    // 읽어올 데이터의 시작위치
    var startPoint = 0
    
    override func viewDidLoad() {
        // API를 호출한다.
        callTheaterAPI()
    }
    
    func callTheaterAPI() {
        // 1. URL을 구성하기 위한 상수값을 선언한다.
        let requestURI = "http://swiftapi.rubypaper.co.kr:2029/theater/list" // API 요청 주소
        let sList = 100 // 블러올 데이터 갯수
        let type = "json" // 데이터 형식
        
        // 2. 인자값들을 모아 URL 객체로 정의한다.
        let urlObj = URL(string: "\(requestURI)?s_page=\(startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            // 3. NSString 객체를 이용하여 API를 호출하고 그 결과값을 인코딩된 문자열로 받아온다
            let stringdata = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            
            // 4. 문자열로 받은 데이터를 UTF-8로 인코딩 처리한 Data로 변환한다.
            let encdata = stringdata.data(using: String.Encoding.utf8.rawValue)
            
            do {
                // 5. Data 객체를 파싱하여 NSAarray 객체로 변환한다.
                let  apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                // 6. 읽어온 데이터를 순회하면서 list 배열에 추가한다.
                for obj in apiArray! {
                    list.append(obj as! NSDictionary)
                }
            } catch {
                // 경고창 형식으로 오류 메세지를 표시해준다.
                let alert = UIAlertController(title: "살패", message: "데이터 분석이 실패하였습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                present(alert, animated: false)
            }
            // 7. 읽어봐야 할 다음 페이지의 데이터 시작 위치를 구해 저장해둔다.
            startPoint += sList
        } catch {
            // 경고창 형식으로 오류 메세지를 표시해준다.
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            present(alert, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // list 배열에서 행에 맞는 데이터를 꺼냄
        let obj = list[indexPath.row]
        
        // 재사용 큐로부터 tCell 식병자에 맞는 셀 객체를 전달받음
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue_map") { // 실행된 세그웨이의 식별자가 segue_map이라면
            // 선택된 셀의 행 정보
            let path = tableView.indexPath(for: sender as! UITableViewCell)
            // 선택된 셀에 사용된 데이터
            let data = list[path!.row]
            // 세그웨이가 이동할 목적지 뷰 컨트롤러 객체를 구하고, 선언된 param 변수에 데이터를 연결해준다.
            (segue.destination as? TheaterViewController)?.param = data
        }
    }
}
