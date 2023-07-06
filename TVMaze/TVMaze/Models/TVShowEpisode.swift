//
//  TVShowEpisode.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import Foundation

struct TVShowEpisode: Decodable, Identifiable {
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
