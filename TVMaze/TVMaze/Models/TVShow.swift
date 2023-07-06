//
//  TVShow.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import Foundation

struct TVShow: Decodable, Identifiable {
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network: Network?
    let webChannel: WebChannel?
    let dvdCountry: String?
    let externals: Externals?
    let image: Image?
    let summary: String?
    let updated: Int?
    let links: Links?

    struct Schedule: Decodable {
        let time: String?
        let days: [String]?
    }

    struct Rating: Decodable {
        let average: Double?
    }

    struct Network: Decodable {
        let id: Int?
        let name: String?
        let country: Country?
        let officialSite: String?

        struct Country: Decodable {
            let name: String?
            let code: String?
            let timezone: String?
        }
    }

    struct WebChannel: Decodable {
        let id: Int?
        let name: String?
        let country: Country?
        let officialSite: String?

        struct Country: Decodable {
            let name: String?
            let code: String?
            let timezone: String?
        }
    }

    struct Externals: Decodable {
        let tvrage: Int?
        let thetvdb: Int?
        let imdb: String?
    }

    struct Image: Decodable {
        let medium: String?
        let original: String?
    }

    struct Links: Decodable {
        let selfLink: Link?
        let previousEpisode: Link?

        enum CodingKeys: String, CodingKey {
            case selfLink = "self"
            case previousEpisode = "previousepisode"
        }

        struct Link: Decodable {
            let href: String?
        }
    }
}

extension TVShow: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(url)
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(language)
        hasher.combine(genres)
        hasher.combine(status)
        hasher.combine(runtime)
        hasher.combine(averageRuntime)
        hasher.combine(premiered)
        hasher.combine(ended)
        hasher.combine(officialSite)
        hasher.combine(weight)
        hasher.combine(dvdCountry)
        hasher.combine(summary)
        hasher.combine(updated)
    }
}

extension TVShow: Equatable {
    static func ==(lhs: TVShow, rhs: TVShow) -> Bool {
        return lhs.id == rhs.id &&
        lhs.url == rhs.url &&
        lhs.name == rhs.name &&
        lhs.type == rhs.type &&
        lhs.language == rhs.language &&
        lhs.genres == rhs.genres &&
        lhs.status == rhs.status &&
        lhs.runtime == rhs.runtime &&
        lhs.averageRuntime == rhs.averageRuntime &&
        lhs.premiered == rhs.premiered &&
        lhs.ended == rhs.ended &&
        lhs.officialSite == rhs.officialSite &&
        lhs.weight == rhs.weight &&
        lhs.dvdCountry == rhs.dvdCountry &&
        lhs.summary == rhs.summary &&
        lhs.updated == rhs.updated
    }
}
