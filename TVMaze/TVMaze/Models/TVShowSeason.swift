//
//  TVShowSeason.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

class TVShowSeason: Decodable, Identifiable {
    let id: Int
    let url: String
    let number: Int
    let name: String
    let episodeOrder: Int?
    let premiereDate: String?
    let endDate: String?
    let network: Network
    let webChannel: String?
    let image: Image?
    let summary: String?
    let links: Links?
    var episodes: [TVShowEpisode]?

    struct Network: Codable {
        let id: Int
        let name: String
        let country: Country
        let officialSite: String?

        struct Country: Codable {
            let name: String
            let code: String
            let timezone: String
        }
    }

    struct Image: Codable {
        let medium: String
        let original: String
    }

    struct Links: Codable {
        let selfLink: String

        enum CodingKeys: String, CodingKey {
            case selfLink = "self"
        }
    }
}

extension TVShowSeason: Equatable {
    static func ==(lhs: TVShowSeason, rhs: TVShowSeason) -> Bool {
        return lhs.id == rhs.id &&
        lhs.url == rhs.url &&
        lhs.number == rhs.number &&
        lhs.name == rhs.name &&
        lhs.episodeOrder == rhs.episodeOrder &&
        lhs.premiereDate == rhs.premiereDate &&
        lhs.endDate == rhs.endDate &&
        lhs.webChannel == rhs.webChannel &&
        lhs.summary == rhs.summary
    }
}
