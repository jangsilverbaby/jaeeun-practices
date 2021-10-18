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
        let dbPath = self.getDBPath()
        self.dbExcute(dbPath: dbPath)
    }
    
    func getDBPath() -> String {
        // 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다.
        let fileMgr = FileManager() // 파일 매니저 객체 생성
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first! // 생성된 매니저 객체를 사용하여 앱 내의 문서 디렉터리 경로를 찾고, 이를 URL 객체로 생성합니다.
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path // URL 객체에 "db.sqlite" 팡리 경로를 추가한 SQLite3 데이터베이스 경로를 만들어 냅니다.
        
        // dbPath 경로에 파일이 없다면 앱 번들에 만들어 둔 db.sqlite를 가져와 복사한다.
        if fileMgr.fileExists(atPath: dbPath) == false { // dbPath 경로에 파일이 있는지 없는지 체크
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite") // 만약 파일이 없다면 앱 변들에 포함된 db.sqlite 파일의 경로를 읽어온다.
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath) // 번들 파일 경로에 있는 db.sqlite 파일을 dbPath 경로에 복사한다.
        }
        return dbPath
    }
    
    func dbExcute(dbPath: String) {
        
        // 중첩된 if 구문으로 인해 깊어진 기존 코드를 guard 구문으로 대체하면서 전체적으로 일정한 깊이 유지
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {
            print("Database Connect Fail")
            return
        }
        // 데이터 베이스 연결 종료
        defer { // defer 블록 : 함수나 메소드에서 코드의 흐름과 상관없이 가장 마지막에 실행되는 블록(=지연 블록)
            print("Close Database Connection")
            sqlite3_close(db)
        }
        
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else {
            print("Prepare Statement Fail")
            return
        }
        // stmt 변수 해제
        defer {
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Create Table Success!")
        }
    }
}
