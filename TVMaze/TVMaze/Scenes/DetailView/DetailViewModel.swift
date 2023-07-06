//
//  DetailViewModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    let show: TVShow
    @Published var isLoading = true
    @Published var hasLoadedData: Bool = false
    @Published var episodes = [TVShowEpisode]()
    @Published var seasons = [TVShowSeason]()
    @Published var showAlert = false

    lazy var tvShowModel: TVShowModelProtocol = TVShowModel()

    init(show: TVShow) {
        self.show = show
    }

    func fetchSeasonsList() async throws {
        guard !hasLoadedData else { return }

        setLoadingValue(with: true)

        do {
            let seasons = try await tvShowModel.fetchSeasons(from: show.id)
            DispatchQueue.main.async {
                self.seasons = seasons
                self.hasLoadedData = true
            }
        } catch(let error) {
            DispatchQueue.main.async {
                self.hasLoadedData = false
            }
            showAlert = true
            print(error.localizedDescription)
        }
        setLoadingValue(with: false)
    }

    func updateEpisodeWithShowName(_ episode: TVShowEpisode) -> TVShowEpisode {
        episode.showName = show.name
        return episode
    }

    private func setLoadingValue(with value: Bool) {
        DispatchQueue.main.async {
            self.isLoading = value
        }
    }
}
