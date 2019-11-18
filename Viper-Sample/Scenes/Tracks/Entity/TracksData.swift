//
//  TracksData.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/13/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
// MARK: - PollsDetails
struct TracksData: Codable {
    let tracks: [Track]?
    let albums: [Album]?
    enum CodingKeys: String, CodingKey {
        case tracks = "Tracks"
        case albums = "Albums"
    }
}

// MARK: - Album
struct Album: Codable {
    let name: String?
    let artist: Artist?
    let albumArtWork: String?
    let id: String?
    enum CodingKeys: String, CodingKey {
        case name, artist
        case albumArtWork = "album_art_work"
        case id
    }
}

enum Artist: String, Codable {
    case linkinPark = "linkin park"
}

// MARK: - Track
struct Track: Codable {
    let trackAlbum, name: String?
    let artist: Artist?
    let trackArtWork: String?
    let id: String?
    enum CodingKeys: String, CodingKey {
        case trackAlbum = "track_album"
        case name, artist
        case trackArtWork = "track_art_work"
        case id
    }
}
extension TracksData {
    init?(data: Data) {
        do {
            let me = try JSONDecoder().decode(TracksData.self, from: data)
            self = me
        } catch {
            print(error)
            return nil
        }
    }
}
