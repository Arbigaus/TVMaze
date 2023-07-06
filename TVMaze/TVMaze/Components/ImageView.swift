//
//  ImageView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import SwiftUI

struct ImageView: View {
    let imageUrl: String

    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                LoadingRow()
            }
            .aspectRatio(contentMode: .fit)
            .clipped()
        }
    }

    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/1/4600.jpg")
    }
}
