//
//  ShowCard.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import SwiftUI

struct ShowCard: View {
    let show: TVShow

    var body: some View {
        HStack(spacing: 4) {
            ImageView(imageUrl: show.image?.medium ?? "")
                .frame(height: 120)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(show.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(show.language ?? "")
                    .font(.subheadline)
                Spacer()
                HStack {
                    ForEach(show.genres ?? [], id: \.self) { genre in
                        Tag(genre: genre)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
        }
    }

    private struct Tag: View {
        let genre: String

        var body: some View {
            Text(genre)
                .font(.caption)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(Color(genre))
                )
        }
    }
}

struct ShowCard_Previews: PreviewProvider {
    static var previews: some View {
        let tvShow = TVShow(id: 1,
                            url: "https://example.com/show",
                            name: "Game of Thrones",
                            type: "Scripted",
                            language: "English",
                            genres: ["Fantasy", "Drama"],
                            status: "Ended",
                            runtime: 60,
                            averageRuntime: 55,
                            premiered: "2011-04-17",
                            ended: "2019-05-19",
                            officialSite: "https://www.hbo.com/game-of-thrones",
                            schedule: TVShow.Schedule(time: "21:00", days: ["Sunday"]),
                            rating: TVShow.Rating(average: 9.3),
                            weight: 93,
                            network: TVShow.Network(id: 8,
                                                    name: "HBO",
                                                    country: TVShow.Network.Country(name: "United States",
                                                                                    code: "US",
                                                                                    timezone: "America/New_York"),
                                                    officialSite: "https://www.hbo.com/"),
                            webChannel: nil,
                            dvdCountry: nil,
                            externals: TVShow.Externals(tvrage: 24493,
                                                        thetvdb: 121361,
                                                        imdb: "tt0944947"),
                            image: TVShow.Image(medium: "https://example.com/show/image-medium.jpg",
                                                original: "https://example.com/show/image-original.jpg"),
                            summary: "Game of Thrones is a fantasy drama television series...",
                            updated: 1625364184,
                            links: TVShow.Links(selfLink: TVShow.Links.Link(href: "https://example.com/show/1"),
                                                previousEpisode: nil))
        ShowCard(show: tvShow)
    }
}
