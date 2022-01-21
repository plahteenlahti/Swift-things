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

}
