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
