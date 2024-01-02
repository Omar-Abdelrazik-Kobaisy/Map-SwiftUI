//
//  Map_SwiftUIApp.swift
//  Map-SwiftUI
//
//  Created by Omar AbdElrazek on 01/01/2024.
//

import SwiftUI

@main
struct Map_SwiftUIApp: App {
    @StateObject private var vm: LocationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
