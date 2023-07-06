//
//  EpisodeViewModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 06/07/23.
//

import Foundation

final class EpisodeViewModel: ObservableObject {
    let episode: TVShowEpisode

    init(episode: TVShowEpisode) {
        self.episode = episode
    }
}
