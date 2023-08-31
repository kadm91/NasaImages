//
//  ImageCard.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/29/23.
//

import SwiftUI

struct ImageCard: View {
    
    var nasaImage: NasaImage
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            AsyncImage(url: URL(string: nasaImage.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 220)
                    .cornerRadius(30)
            } placeholder: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.gray)
                        .background(.thinMaterial)
                        .opacity(0.15)
                        .frame(width: 400, height: 220 )
    
                    ProgressView().tint(.white).controlSize(.large)
                }
                
            }
            VStack (alignment: .leading, spacing: 5) {
                Text(nasaImage.title)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    
                Text(nasaImage.date.toDate() ?? "")
                    .font(.caption)
                    
            }
            .padding()
            .foregroundColor(.white)
            .bold()
            .shadow(radius: 25)
            
        }
        .cornerRadius(30)
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(nasaImage: previewImagesResults[0])
    }
}
