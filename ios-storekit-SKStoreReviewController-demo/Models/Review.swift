//
//  Review.swift
//  ios-storekit-SKStoreReviewController-demo
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class Review {
    
    /// 表示期間の条件
    static private let displayPeriod = 60 * 60 * 24 * 30
    
    /// 起動回数の条件
    static private let displayLaunchTimes = 10
    
    /// レビュー促進アラートに関する情報
    ///
    /// - lastDisplayAlertDate: 表示期間
    enum ReviewSettings: String {
        case lastDisplayAlertDate = "LastDisplayAlertDate"
    }
    
    /// レビュー促進アラートを表示すべきか？
    ///
    /// - Returns: 結果
    static func shouldShowAlert() -> Bool {
        
        let isPassedPeriod = Review.isPassedPeriod(targetDate: Date(),
                                                   lastDate: lastDisplayAlertDate())
        
        let isMoreThanLaunchTimes = Review.isMoreThanLaunchTimes(launchTime: LaunchManager.launchTimes())
        
        return isPassedPeriod && isMoreThanLaunchTimes
    }
    
    /// 表示期間以上を経過したか？
    ///
    /// - Parameters:
    ///   - targetDate: 対象の日付
    ///   - lastDate: 最後に表示した日付
    /// - Returns: 結果
    static func isPassedPeriod(targetDate: Date, lastDate: Date?) -> Bool {
        
        // 初回起動時
        guard let lastDate = lastDate else {
            return true
        }
        
        return targetDate.timeIntervalSince(lastDate) > Double(displayPeriod)
    }
    
    /// 指定条件以上起動したか？
    ///
    /// - Parameter launchTime: 起動回数
    /// - Returns: 結果
    static func isMoreThanLaunchTimes(launchTime: Int) -> Bool {
        return launchTime >= displayLaunchTimes
    }
    
    /// 最後にレビューアラートを表示した日時を保存
    ///
    /// - Parameter targetDate: 対象の日付
    static func saveLastDisplayAlertDate(targetDate: Date) {
        UserDefaults.standard.set(targetDate,
                                  forKey: ReviewSettings.lastDisplayAlertDate.rawValue)
    }
    
    /// 最後にレビューアラートを表示した日時を取得
    ///
    /// - Returns: 最後にレビューアラートを表示した日時
    static func lastDisplayAlertDate() -> Date? {
        return UserDefaults.standard.object(forKey: ReviewSettings.lastDisplayAlertDate.rawValue) as? Date
    }
}
