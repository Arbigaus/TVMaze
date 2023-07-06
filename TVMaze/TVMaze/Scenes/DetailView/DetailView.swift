//
//  DetailView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ShowCard(show: viewModel.show)

            if let summary = viewModel.show.summary {
                Text("Summary")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .padding(.bottom, 4)

                Text(summary.removingHTMLTags())
                    .font(.body)
            }

            ForEach(viewModel.seasons) { season in
                Section("Season \(season.number)") {
                    ForEach(season.episodes ?? []) { episode in
                        Text("Episode \(episode.number ?? 0): \(episode.name)")
                            .font(.body)
                    }
                }
                .padding()
            }

            if viewModel.isLoading {
                LoadingRow()
            }
        }
        .task {
            try? await viewModel.fetchSeasonsList()
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .navigationTitle(viewModel.show.name)
        .listRowBackground(Color.clear)
        .frame(maxWidth: .infinity)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

