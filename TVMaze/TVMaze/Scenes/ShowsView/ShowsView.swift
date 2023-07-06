//
//  ShowsView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import SwiftUI

struct ShowsView: View {
    @ObservedObject private var viewModel: ShowViewModel
    @State private var isSearchActive = false

    init(viewModel: ShowViewModel = ShowViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.shows) { show in
                    NavigationLink(value: show) {
                        ShowCard(show: show)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .task {
                                if self.viewModel.shows.isLast(show) {
                                    await self.viewModel.fetchShows()
                                }
                            }
                    }
                }
                if viewModel.isLoading {
                    LoadingRow()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: isSearchActive) {
                        Image(systemName: "magnifyingglass")

                    }
                }
            }
            .navigationTitle("TV Shows")
            .listRowBackground(Color.clear)
            .task {
                await viewModel.fetchShows()
            }
            .navigationDestination(for: TVShow.self) { show in
                detailView(show)
            }
            .navigationDestination(for: Bool.self) { _ in
                SearchView()
            }
        }
    }

    private func detailView(_ show: TVShow) -> DetailView {
        DetailView(viewModel: DetailViewModel(show: show))
    }
}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ShowViewModel()
        viewModel.shows = TVShowMockData.tvShows
        return ShowsView(viewModel: viewModel)
    }
}
