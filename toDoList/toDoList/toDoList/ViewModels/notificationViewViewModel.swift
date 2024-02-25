//
//  notificationViewViewModel.swift
//  toDoList
//

//

import Foundation
import SwiftUI
import UserNotifications

class notificationViewViewModel: ObservableObject {
    @Published var dueTime = Date()
    @Published var notificationTime: Date?
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Task Reminder"
        content.body = "Your task is due soon."
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: dueTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                self.notificationTime = self.dueTime.addingTimeInterval(-60 * 1) // 15 minutes before due time
            }
        }
    }
}
