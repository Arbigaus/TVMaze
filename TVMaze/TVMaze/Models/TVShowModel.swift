//
//  TVShowModel.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import Foundation
import MiniService

protocol TVShowModelProtocol {
    func fetchShowsInPage(_ page: Int) async throws -> [TVShow]
    func searchShow(by name: String) async throws -> [TVShow]
    func fetchEpisodes(from showId: Int) async throws -> [TVShowEpisode]
    func fetchSeasons(from showId: Int) async throws -> [TVShowSeason]
    func fetchEpisodeBySeason(from seasonId: Int) async throws -> [TVShowEpisode] 
}

final class TVShowModel: TVShowModelProtocol {
    private var service: APIServiceProtocol

    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }

    func fetchShowsInPage(_ page: Int) async throws -> [TVShow] {
        do {
            let endpoint = "shows?page=\(page)"
            let response: [TVShow] = try await service.get(endpoint: endpoint)
            return response
        } catch (let error) {
            throw error
        }
    }

    func searchShow(by name: String) async throws -> [TVShow] {
        do {
            let endpoint = "search/shows?q=\(name)"
            let response: [TVShowSearch] = try await service.get(endpoint: endpoint)
            return response.map { $0.show }
        } catch (let error) {
            throw error
        }
    }

    func fetchEpisodes(from showId: Int) async throws -> [TVShowEpisode] {
        do {
            let endpoint = "shows/\(showId)/episodes"
            let response: [TVShowEpisode] = try await service.get(endpoint: endpoint)
            return response
        } catch (let error) {
            throw error
        }
    }

    func fetchSeasons(from showId: Int) async throws -> [TVShowSeason] {
        do {
            let endpoint = "shows/\(showId)/seasons"
            let response: [TVShowSeason] = try await service.get(endpoint: endpoint)
            return response
        } catch (let error) {
            throw error
        }
    }

    func fetchEpisodeBySeason(from seasonId: Int) async throws -> [TVShowEpisode] {
        do {
            let endpoint = "seasons/\(seasonId)/episodes"
            let response: [TVShowEpisode] = try await service.get(endpoint: endpoint)
            return response
        } catch (let error) {
            throw error
        }
    }
}
