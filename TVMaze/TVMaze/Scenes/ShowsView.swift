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
                        Card(show: show)
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
