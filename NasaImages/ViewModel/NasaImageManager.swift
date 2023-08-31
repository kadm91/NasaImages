//
//  NasaImageManager.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/31/23.
//

import Foundation
import Combine

class NasaImageManager: ObservableObject {
    
    @Published var nasaImages: [NasaImage] = []
    
    
    init() {
        self.fetchNasaImages()
    }
    
    private var fetchNasaImagesCancellable: AnyCancellable?
    
  private func fetchNasaImages() {
   
      guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(Secrets.apiKey)&count=50") else {return}
      
        let session = URLSession.shared
        let publisher = session.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError (.badServerResponse)
                }
                
                return data
            }
            .decode(type: [NasaImage].self, decoder: JSONDecoder())
            .sink { (completion) in
            } receiveValue: { [weak self] (returnedData) in
                self?.nasaImages = returnedData
            }
        fetchNasaImagesCancellable = publisher
    }
}
