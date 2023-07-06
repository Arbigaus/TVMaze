//
//  ShowViewModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import Foundation
import SwiftUI

final class ShowViewModel: ObservableObject {
    @Published var shows = [TVShow]()
    @Published var isLoading = false

    @Published var homePath = NavigationPath()

    private var page = 1
    lazy var tvShowModel = TVShowModel()

    func fetchShows() async {
        guard !isLoading else { return }

        setLoadingValue(with: true)
        do {
            let shows = try await tvShowModel.fetchShowsInPage(page)
            DispatchQueue.main.async {
                self.shows.append(contentsOf: shows)
                self.page += 1
            }
        } catch(let error) {
            print(error.localizedDescription)
        }
        setLoadingValue(with: false)
    }

    func navigateToDetail(show: TVShow) {

    }

    private func setLoadingValue(with value: Bool) {
        DispatchQueue.main.async {
            self.isLoading = value
        }
    }
}
