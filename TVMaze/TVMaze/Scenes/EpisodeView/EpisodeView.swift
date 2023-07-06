//
//  EpisodeView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 06/07/23.
//

import SwiftUI

struct EpisodeView: View {
    @ObservedObject private var viewModel: EpisodeViewModel

    init(viewModel: EpisodeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {

                if let urlString = viewModel.episode.image?.medium {
                    ImageView(imageUrl: urlString)
                        .cornerRadius(16)
                }

                Text(viewModel.episode.name)
                    .font(.title)

                HStack(alignment: .top) {

                    if let season = viewModel.episode.season {
                        Text("Season: \(season),")
                            .font(.subheadline)
                    }

                    if let number = viewModel.episode.number {
                        Text("Episode: \(number)")
                            .font(.subheadline)
                    }
                }

                if let runtime = viewModel.episode.runtime {
                    Text("Runtime: \(runtime)m")
                        .font(.subheadline)
                }

                if let rating = viewModel.episode.rating?.average {
                    Text("Rating: \(String(format: "%.2f", rating))")
                        .font(.subheadline)
                }

                if let summary = viewModel.episode.summary {
                    Text("Summary")
                        .font(.title2)
                        .padding(.top, 10)

                    Text(summary.removingHTMLTags())
                        .font(.body)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.episode.showName ?? "")
    }
}
