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
        if let url = URL(string: imageUrl),
           let imageData = try? Data(contentsOf: url),
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Text("Failed to load image")
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://static.tvmaze.com/uploads/images/medium_portrait/1/4600.jpg")
    }
}
