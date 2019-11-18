//
//  TracksInteractor.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
class TracksInteractor: TracksInteractorInPutProtocol {
    var presenter: TracksInteractorOutPutProtocol?
    let url = "https://gist.githubusercontent.com/mohammadZ74/dcd86ebedb5e519fd7b09b79dd4e4558/raw/b7505a54339f965413f5d9feb05b67fb7d0e464e/MvvmExampleApi.json"
    func getData() {
        //Get User Request.......
        DispatchQueue.global(qos: .userInteractive).async {
            NetworkLayer.instanse.fetchData(url: self.url) {(tracksData: TracksData?, _: Error?) in
                if let unwrappedData = tracksData {
                    if let desiredTracks = unwrappedData.tracks {
                        print(desiredTracks)
                        self.presenter?.tracksFetchedSucsessfully(tracks: desiredTracks)
                    } else {
                        self.presenter?.failedToFetchData(stringError: "Failed to get Tracks Data")
                    }
                    if let desiredAlbums = unwrappedData.albums {
                        self.presenter?.albumsFetchedSucsessfully(albums: desiredAlbums)
                    } else {
                        self.presenter?.failedToFetchData(stringError: "Failed to get Albums Data")
                    }
                } else {
                    self.presenter?.failedToFetchData(stringError: "Failed to get the desired Data")
                }
            }
        }
    }
}
