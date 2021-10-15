//
//  ViewController.swift
//  SQLite3-Practice
//
//  Created by eunae on 2021/10/15.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        
        // 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다.
        let fileMgr = FileManager() // 파일 매니저 객체 생성
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first! // 생성된 매니저 객체를 사용하여 앱 내의 문서 디렉터리 경로를 찾고, 이를 URL 객체로 생성합니다.
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path // URL 객체에 "db.sqlite" 팡리 경로를 추가한 SQLite3 데이터베이스 경로를 만들어 냅니다.
        
        // dbPath 경로에 파일이 없다면 앱 번들에 만들어 둔 db.sqlite를 가져와 복사한다.
        if fileMgr.fileExists(atPath: dbPath) == false { // dbPath 경로에 파일이 있는지 없는지 체크
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite") // 만약 파일이 없다면 앱 변들에 포함된 db.sqlite 파일의 경로를 읽어온다.
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath) // 번들 파일 경로에 있는 db.sqlite 파일을 dbPath 경로에 복사한다.
        }
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        
        // libsqlite3 라이브러리의 주요 함수 5형제
        if sqlite3_open(dbPath, &db) == SQLITE_OK { // DB를 연결한다. 이 과정에서 db 객체가 생성된다.
            // 데이터베이스가 연결되었다면
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {// SQL 구문을 전달한 준비를 한다. 이 과정에서 컴파일된 SQL 구문 객체가 생성된다. (=stmt)
                // SQL 컴파일이 잘 끝났다면
                if sqlite3_step(stmt) == SQLITE_DONE { // 컴파일된 SQL 구문 객체를 DB에 전달한다.
                    print("Create Table Success!")
                }
                sqlite3_finalize(stmt) // 컴파일된 SQL 구문 객체를 삭제한다. 이 과정에서 stmt가 해제된다.
            } else {
                print("Prepare Statement Fail")
            }
            sqlite3_close(db) // DB 연결을 종료한다, 이 과정에서 db 객체가 해제된다.
        } else {
            print("Database Connect Fail")
            return
        }
    }
}
