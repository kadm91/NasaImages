//
//  ContentView.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var nasaImagesManager: NasaImageManager
    
    var body: some View {
        
        let backgroundColors = [Color(#colorLiteral(red: 0.007843137255, green: 0.1215686275, blue: 0.2862745098, alpha: 1)), Color(#colorLiteral(red: 0.2980392157, green: 0.2235294118, blue: 0.4392156863, alpha: 1)), Color(#colorLiteral(red: 0.06666666667, green: 0.3176470588, blue: 0.4156862745, alpha: 1))]
        
        NavigationStack {
            VStack {
                
                TitleView()
                    .frame(height: 60)
                
                
                
                if !nasaImagesManager.nasaImages.isEmpty {
                    ScrollView {
                        ForEach(nasaImagesManager.nasaImages, id: \.self) { image in
                            
                            NavigationLink {
                                ImageDetailView(nasaImage: image)
                            } label: {
                                ImageCard(nasaImage: image).padding(.vertical, 5)
                            }
                        }
                    }
                } else {
                    Spacer()
                    LoadingView()
                        .cornerRadius(30)
                    Spacer()
                }
                
                
                
                
                
            }
            
            .foregroundColor(.white)
            .background(LinearGradient(
                colors: backgroundColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
        }
        .tint(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView( )
            .environmentObject(NasaImageManager())
    }
}
