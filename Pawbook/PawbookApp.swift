//
//  PawbookApp.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import SwiftData

@main
struct PawbookApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
        }
        .modelContainer(for: Cat.self)
    }
}
