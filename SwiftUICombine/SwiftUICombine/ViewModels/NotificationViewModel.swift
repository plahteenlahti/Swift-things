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
    @AppStorage("subscribedToAllNotifications") var subscribedToAllNotifications: Bool = false
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
                
                if self.subscribedToAllNotifications {
                    self.subscribeToAllTopics()
                } else {
                    self.unsubscribeFromAllTopics()
                }
                
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                }
                self.unsubscribeFromAllTopics()
            }
            
        }
    }
    
    private func subscribeToAllTopics() {
        guard permission == .authorized else {return}
        
        Messaging.messaging().subscribe(toTopic: "all") {error in
            if let error = error {
                print("Error while subscribing: ", error)
                return
            }
            print("Subscribed to notifications for all topics")
        }
    }
    
    
    private func unsubscribeFromAllTopics() {
        Messaging.messaging().unsubscribe(fromTopic: "all") { error in
            if let error = error {
                print("Error while unsubscribing: ", error)
                return
            }
            print("Unsubscribed from notifications for all topics")
        }
    }
}
