//
//  TVMazeApp.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import SwiftUI
import MiniService

@main
struct TVMazeApp: App {
    var body: some Scene {
        WindowGroup {
            ShowsView()
                .onAppear {
                    checkFirstLaunch()
                }
        }
    }
    func checkFirstLaunch() {
        let key = "isFirstLaunch"
        let isFirstLaunch = UserDefaults.standard.bool(forKey: key)
        if !isFirstLaunch {
            UserDefaults.standard.set(true, forKey: key)
            APIService.setBaseURL("https://api.tvmaze.com/")
            UserDefaults.standard.synchronize()
        }
    }
}
