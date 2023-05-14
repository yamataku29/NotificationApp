//
//  ViewController.swift
//  NotificationApp
//
//  Created by Taku Yamada on 2023/05/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestPushAuthrization()
    }


    func requestPushAuthrization() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if let error = error {
                print("‼️error: \(error)")
                return
            }
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }

    }
}

