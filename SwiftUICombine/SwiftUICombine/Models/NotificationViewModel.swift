//
//  NotificationViewModel.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 21.1.2022.
//

import Foundation
import SwiftUI
import UserNotifications
import FirebaseMessaging


class NotificationViewModel: ObservableObject {
    @Published var permission: UNAuthorizationStatus?
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings() { permission in
            DispatchQueue.main.async {
                self.permission = permission.authorizationStatus
            }
            
            if(permission.authorizationStatus == .authorized) {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                }
            }
            
        }
    }
}
