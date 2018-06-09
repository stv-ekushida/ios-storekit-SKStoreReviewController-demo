//
//  ViewController.swift
//  ios-storekit-SKStoreReviewController-demo
//
//  Created by Eiji Kushida on 2018/06/08.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit
import StoreKit

final class ViewController: UIViewController {

    //MARK: - IBAction
    @IBAction func didTapShowReviewButton(_ sender: UIButton) {
        
        //note : iOS10.3+ / Review Guideline 1.1.7
        // https://developer.apple.com/documentation/storekit/skstorereviewcontroller/
        // https://developer.apple.com/app-store/review/guidelines/
        
        guard Review.shouldShowAlert() else {
            return
        }        
        SKStoreReviewController.requestReview()
        Review.saveLastDisplayAlertDate(targetDate: Date())
    }
}
