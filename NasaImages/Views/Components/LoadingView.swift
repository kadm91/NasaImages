//
//  LoadingView.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/31/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.gray)
                .background(.thinMaterial)
                .opacity(0.15)
            
            VStack (spacing: 10){
                ProgressView()
                    .controlSize(.large)
                
                Text("Loading Images...")
                    .foregroundColor(.gray)
                    .bold()
                    .opacity(0.8)
            }
        }
        .frame(width: 200, height: 200)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            //.preferredColorScheme(.dark)
    }
}
