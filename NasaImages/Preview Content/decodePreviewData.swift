//
//  decodePreviewData.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/29/23.
//

import Foundation

var previewImagesResults: [NasaImage] = load("PreviewData.json")


func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't Find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
       // decoder.keyDecodingStrategy = .convertFromSnakeCase // use this line if the json contains snakecase name objects
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

