//
//  DesignCodeApp.swift
//  DesignCode
//
//  Created by Mac on 16.04.2021.
//

import SwiftUI
import Firebase 

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    FirebaseApp.configure()
    return true
  }
}

@main
struct DesignCodeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            //Home().environmentObject(UserStore())
            TabBar()
        }
    }
}
