//
//  ReviewTests.swift
//  ios-storekit-SKStoreReviewController-demoTests
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_storekit_SKStoreReviewController_demo

final class ReviewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
        
    /// 表示期間の条件テスト
    func testDisplayPeriod() {

        do {
            // 初回起動のとき
            let lastDate: Date? = nil
            let targetDate = stringToDate(dateString: "2018/07/01 00:00:00")
            
            let result = Review.isPassedPeriod(targetDate: targetDate, lastDate: lastDate)
            XCTAssertTrue(result)
        }
        
        do {
            // 30日目のとき
            let lastDate = stringToDate(dateString: "2018/06/01 00:00:00")
            let targetDate = stringToDate(dateString: "2018/07/01 00:00:00")
            
            let result = Review.isPassedPeriod(targetDate: targetDate, lastDate: lastDate)
            XCTAssertFalse(result)
        }
        
        do {
            // 31日目のとき
            let lastDate = stringToDate(dateString: "2018/06/01 00:00:00")
            let targetDate = stringToDate(dateString: "2018/07/02 00:00:00")
            
            let result = Review.isPassedPeriod(targetDate: targetDate, lastDate: lastDate)
            XCTAssertTrue(result)
        }
    }
    
    /// 表示回数の条件テスト
    func testDisplayLaunchTimes() {
        
        do {
            // 起動回数：9のとき
            let launchTime = 9
            let result = Review.isMoreThanLaunchTimes(launchTime: launchTime)
            XCTAssertFalse(result)
        }
        
        do {
            // 起動回数：10のとき
            let launchTime = 10
            let result = Review.isMoreThanLaunchTimes(launchTime: launchTime)
            XCTAssertTrue(result)
        }
    }
    
    /// 最後にアラートを表示した日の保存/読み出しテスト
    func testLastDisplayAlertDate() {
        
        do {
            // データが保存されていないとき
            let result = Review.lastDisplayAlertDate()
            XCTAssertNil(result)
        }
        
        do {
            // データを保存したとき
            let targetDate = stringToDate(dateString: "2018/06/06 00:00:00")
            Review.saveLastDisplayAlertDate(targetDate: targetDate)
            let result = Review.lastDisplayAlertDate()
            XCTAssertEqual(result, targetDate)
        }
    }
    
    //MARK: - Helper
    /// 文字列⇒日付変換
    ///
    /// - Parameter dateString: 日付（文字列）
    /// - Returns: 日付
    private func stringToDate(dateString: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return dateFormater.date(from: dateString) ?? Date()
    }
    
    /// 日付⇒文字列変換
    ///
    /// - Parameter date: 日付
    /// - Returns: 日付（文字列）
    private func dateToString(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ja_JP")
        dateFormater.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return dateFormater.string(from: Date())
    }
}
