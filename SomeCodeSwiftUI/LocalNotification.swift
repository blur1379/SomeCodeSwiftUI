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
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notifications"
        content.subtitle = "This is the subtitle"
        content.sound = .default
        content.badge = 1
        
        // trigger by time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // trigger by calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 22
        dateComponents.minute = 4
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotification: View {
    var body: some View {
        Button("request permission") {
            NotificationManager.instance.requestAuthorization()
        }
        Button("schedule notification") {
            NotificationManager.instance.scheduleNotification()
        }
    }
}

#Preview {
    LocalNotification()
}
