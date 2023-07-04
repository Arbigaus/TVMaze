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

    struct DetailView: View {
        var body: some View {
            VStack {
                Text("Detail View")
            }
            .navigationTitle("Detail")
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.shows) { show in

                    NavigationLink(destination: DetailView()) {
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
                                        Text(genre)
                                            .font(.caption)
                                            .padding(4)
                                            .background(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .foregroundColor(Color(genre))
                                            )
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
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
            }
            .navigationTitle("TV Shows")
            .listStyle(PlainListStyle())
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .task {
                await viewModel.fetchShows()
            }
        }
    }

    private var loadingRow: some View {
        VStack(alignment: .center, spacing: 12) {
            ProgressView()
                .frame(maxWidth: .infinity)
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
