//
//  LocalNotifiationService.swift
//  Navigation
//
//  Created by Максим Жуин on 22.03.2024.
//

import Foundation
import UserNotifications

final class LocalNotifiationService {
    
    var notificationCategoryID: String?
    var actionID: String?

    static let shared = LocalNotifiationService()

    private init() {}

    func registeForLatestUpdatesIfPossible() {
        registerUpdateCategory(with: "MyCategory", actionID: "MyAction")

        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .provisional]) {  _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func setNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Посмотрите последние обновления"
        content.sound = .default
        content.categoryIdentifier = self.notificationCategoryID!

        // MARK: Здесь, по идее, нужно сделать проверку на 12/24ч формат времени.
        var dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: self.notificationCategoryID!, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    func registerUpdateCategory(with category: String, actionID: String) {
        self.actionID = actionID
        self.notificationCategoryID = category
        let firstAction = UNNotificationAction(identifier: self.actionID!, title: "First Test Button")
        let secondAction = UNNotificationAction(identifier: self.actionID!, title: "Second Test Button")
        let notificationCategory = UNNotificationCategory(identifier: category, actions: [firstAction, secondAction],
                                                          intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([notificationCategory])
    }
}
