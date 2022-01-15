//
//  SwiftUICombineApp.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 13.1.2022.
//

import SwiftUI
import Firebase



@main
struct SwiftUICombineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
