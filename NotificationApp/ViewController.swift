//
//  ViewController.swift
//  NotificationApp
//
//  Created by Taku Yamada on 2023/05/15.
//

import UIKit
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestPushAuthrization()
        getTokenOfFCM()
    }


    func requestPushAuthrization() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if let error = error {
                print("‼️Error: \(error)")
                return
            }
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    func getTokenOfFCM() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("‼️Error fetching FCM registration token: \(error)")
            }
            guard let token = token else {
                print("‼️Error: Not found FCM token")
                return
            }
            print("📝FCM registration token: \(token)")
        }
    }
}

