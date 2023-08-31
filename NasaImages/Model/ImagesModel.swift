//
//  ImagesModel.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/30/23.
//

import Foundation

struct NasaImage: Decodable, Hashable {
    
    let copyright: String?
    let date: String
    let explanation: String
    let title: String
    let url: String

}
