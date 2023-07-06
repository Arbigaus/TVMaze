//
//  DetailViewModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    let show: TVShow
    @Published var isLoading = false
    @Published var episodes = [TVShowEpisode]()
    @Published var seasons = [TVShowSeason]()

    lazy var tvShowModel: TVShowModelProtocol = TVShowModel()

    init(show: TVShow) {
        self.show = show
    }

    func fetchEpisodesListBySeason(seasons: [TVShowSeason]) async throws {
        for season in seasons {
            do {
                let episodes = try await tvShowModel.fetchEpisodeBySeason(from: season.id)
                DispatchQueue.main.async {
                    season.episodes = episodes
                }
            } catch(let error) {
                print(error.localizedDescription)
            }

        }
        DispatchQueue.main.async {
            self.seasons = seasons
        }

    }

    func fetchSeasonsList() async throws {
        guard !isLoading else { return }

        setLoadingValue(with: true)

        do {
            let seasons = try await tvShowModel.fetchSeasons(from: show.id)
            try await fetchEpisodesListBySeason(seasons: seasons)
        } catch(let error) {
            print(error.localizedDescription)
        }

        setLoadingValue(with: false)
    }

    private func setLoadingValue(with value: Bool) {
        DispatchQueue.main.sync {
            self.isLoading = value
        }
    }
}
