//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
