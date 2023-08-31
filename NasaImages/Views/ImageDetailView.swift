//
//  ImageDetailView.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/30/23.
//

import SwiftUI

struct ImageDetailView: View {
    
    var nasaImage: NasaImage
    
    var body: some View {
        
        let backgroundColors = [Color(#colorLiteral(red: 0.01809120178, green: 0.07994923741, blue: 0.1546407342, alpha: 1)), Color(#colorLiteral(red: 0.01809120178, green: 0.07994923741, blue: 0.1546407342, alpha: 1)), Color(#colorLiteral(red: 0.3261222839, green: 0.05878159404, blue: 0.117963843, alpha: 1))]
        
     
            ScrollView {
                
               
                AsyncImage(url: URL(string: nasaImage.url)) { image in
                    image
                        .resizable()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fill)



                } placeholder: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .background(.thinMaterial)
                            .opacity(0.15)
                            .ignoresSafeArea(edges: .top)
                        .frame(height: 300)

                        ProgressView()
                            .tint(.white)
                            .controlSize(.large)
                    }
                }
                
                
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    
                    HStack {
                        Text(nasaImage.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    
                    Text("Date:  \(nasaImage.date.toDate() ?? "")")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.secondary)
                    
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Description:")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Text(nasaImage.explanation)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    
                    
                    if nasaImage.copyright != nil {
                        
                        Divider()
                        .padding(.top)
                        
                        VStack(alignment: .leading) {
                        Text("Copyrights:")
                        
                        Text (nasaImage.copyright!)
                        
                    }
                    
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                }
                    
                    
                }
                .padding()
               
                
              
            }
            .background(LinearGradient(
                colors: backgroundColors,
                startPoint: .zero,
                endPoint: .bottomTrailing
            ))
        .ignoresSafeArea(edges: .top)
    }
       
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(nasaImage: previewImagesResults[0])
            .preferredColorScheme(.dark)
    }
}
