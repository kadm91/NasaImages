//
//  TitleView.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/29/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
       
            HStack(alignment: .center, spacing: 5) {
            
                Image("NASA_logo")
                    .resizable()
                    .frame(width: 80, height: 70)
                    .padding(.horizontal)
                
                Text("Nasa Images")
                    .font(.title)
                    .fontWeight(.black)

               Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
