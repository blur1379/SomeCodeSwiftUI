//
//  LccalNotification.swift
//  SomeCodeSwiftUI
//
//  Created by Mohammad Blur on 5/29/24.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization { success, error in
            if let error {
                print(error)
            } else {
                print("success")
            }
        }
    }
}

struct LccalNotification: View {
    var body: some View {
        Button("request permission") {
            NotificationManager.instance.requestAuthorization()
        }
    }
}

#Preview {
    LccalNotification()
}
