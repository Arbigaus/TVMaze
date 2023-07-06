//
//  SearchViewModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var shows = [TVShow]()
    @Published var isLoading = false

    lazy var tvShowModel: TVShowModelProtocol = TVShowModel()

    func searchShows(by name: String) async throws {
        guard !isLoading else { return }

        setLoadingValue(with: true)
        setShowsValues(with: [TVShow]())
        do {
            let shows = try await tvShowModel.searchShow(by: name)
            DispatchQueue.main.async {
                self.setShowsValues(with: shows)
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
        setLoadingValue(with: false)
    }

    private func setShowsValues(with shows: [TVShow]) {
        DispatchQueue.main.async {
            self.shows = shows
        }
    }

    private func setLoadingValue(with value: Bool) {
        DispatchQueue.main.async {
            self.isLoading = value
        }
    }
}
