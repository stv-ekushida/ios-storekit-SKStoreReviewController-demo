//
//  LaunchManager.swift
//  ios-storekit-SKStoreReviewController-demo
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class LaunchManager {
    
    /// 起動に関する情報
    ///
    /// - launchTimes: 起動回数
    enum Info: String {
        case launchTimes = "LaunchTimes"
    }
    
    /// 起動回数を保存
    ///
    /// - Parameter targetDate: 対象の日付
    static func countUpLaunchTimes() {
        UserDefaults.standard.set(LaunchManager.launchTimes() + 1, forKey: LaunchManager.Info.launchTimes.rawValue)
    }
    
    /// 起動回数を取得
    ///
    /// - Returns: 最後にレビューアラートを表示した日時
    static func launchTimes() -> Int {
        return UserDefaults.standard.integer(forKey: LaunchManager.Info.launchTimes.rawValue)
    }
}
