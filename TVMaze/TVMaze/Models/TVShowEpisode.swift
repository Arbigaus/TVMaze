//
//  TVShowEpisode.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

class TVShowEpisode: Decodable, Identifiable {
    let id: Int
    let url: String
    let name: String
    let season: Int?
    let number: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp: String?
    let runtime: Int?
    let rating: Rating?
    let image: Image?
    let summary: String?
    let links: Links?
    var showName: String?

    struct Rating: Codable {
        let average: Double?
    }

    struct Image: Codable {
        let medium: String?
        let original: String?
    }

    struct Links: Codable {
        let selfLink: Link?
        let show: Link?

        enum CodingKeys: String, CodingKey {
            case selfLink = "self"
            case show
        }

        struct Link: Codable {
            let href: String?
        }
    }
}

extension TVShowEpisode: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: TVShowEpisode, rhs: TVShowEpisode) -> Bool {
        return lhs.id == rhs.id &&
        lhs.url == rhs.url &&
        lhs.name == rhs.name &&
        lhs.season == rhs.season &&
        lhs.number == rhs.number &&
        lhs.type == rhs.type &&
        lhs.airdate == rhs.airdate &&
        lhs.airtime == rhs.airtime &&
        lhs.airstamp == rhs.airstamp &&
        lhs.runtime == rhs.runtime &&
        lhs.summary == rhs.summary
    }
}
