//
//  ShowsView+Extensions.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import SwiftUI

extension ShowsView {
    struct Tag: View {
        let genre: String

        var body: some View {
            Text(genre)
                .font(.caption)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(Color(genre))
                )
        }
    }

    struct Card: View {
        let show: TVShow

        var body: some View {
            HStack(spacing: 4) {
                ImageView(imageUrl: show.image?.medium ?? "")
                    .frame(height: 120)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(show.name ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(show.language ?? "")
                        .font(.subheadline)
                    Spacer()
                    HStack {
                        ForEach(show.genres ?? [], id: \.self) { genre in
                            Tag(genre: genre)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
            }
        }
    }
}
