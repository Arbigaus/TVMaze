//
//  ShowsView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import SwiftUI

struct ShowsView: View {
    @ObservedObject private var viewModel: ShowViewModel

    init(viewModel: ShowViewModel = ShowViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.shows) { show in
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
                            ForEach(show.genres ?? [], id: \.self) { genre in
                                HStack {
                                    Text(genre)
                                        .font(.caption)
                                }
                            }
                            .background(.red)
                        }
                        .background(.blue)
                        .padding(8)
                    }
                    .listRowInsets(EdgeInsets())
                    .background(.green)
                    .task {
                        if self.viewModel.shows.isLast(show) {
                            await self.viewModel.fetchShows()
                        }
                    }
                }
                if viewModel.isLoading {
                    loadingRow
                }
            }
            .navigationTitle("TV Shows")
            .task {
                await viewModel.fetchShows()
            }
        }
    }

    private var loadingRow: some View {
        VStack(alignment: .center, spacing: 12) {
            ProgressView()
        }
        .padding()
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ShowViewModel()
        viewModel.shows = TVShowMockData.tvShows
        return ShowsView(viewModel: viewModel)
    }
}
