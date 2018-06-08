//
//  LaunchManagerTests.swift
//  ios-storekit-SKStoreReviewController-demoTests
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_storekit_SKStoreReviewController_demo

final class LaunchManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    /// 起動回数の保存/読み出しテスト
    func testLastDisplayAlertDate() {
        
        do {
            // 初回起動時
            let result = LaunchManager.launchTimes()
            XCTAssertEqual(result, 0)
        }
        
        do {
            // 1回起動
            LaunchManager.countUpLaunchTimes()
            let result = LaunchManager.launchTimes()
            XCTAssertEqual(result, 1)
        }
        
        do {
            // 2回起動
            LaunchManager.countUpLaunchTimes()
            let result = LaunchManager.launchTimes()
            XCTAssertEqual(result, 2)
        }
    }
}
