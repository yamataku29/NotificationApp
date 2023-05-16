//
//  ViewController.swift
//  NotificationApp
//
//  Created by Taku Yamada on 2023/05/15.
//

import UIKit
import FirebaseInstallations

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestPushAuthrization()
        Installations.installations().installationID { (id, error) in
            if let error = error {
                print("‼️Error fetching id: \(error)")
                return
            }
            guard let id = id else { return }
            print("👀id: \(id)")
        }
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

