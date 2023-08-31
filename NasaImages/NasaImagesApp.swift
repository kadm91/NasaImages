//
//  NasaImagesApp.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/29/23.
//

import SwiftUI

@main
struct NasaImagesApp: App {

@StateObject var nasaImagesManager = NasaImageManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(nasaImagesManager)
                .preferredColorScheme(.dark)
        }
        
    }
}
