//
//  TracksProtocols.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

protocol TracksViewProtocol: class {
    var presenter: TracksPresenterProtocol! {get set}
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadTracksData()
    func reloadAlbumsData()
    func showAlert(withTitle title: String)
}
protocol TracksPresenterProtocol: class {
    var view: TracksViewProtocol? {get set}
    func viewDidLoad()
    func numOfRows() -> Int
    func configure(tracksCell cell: TracksCellView, AtIndexpath indexPath: IndexPath)
    func albumsNumberOfRow() -> Int
    func configure(albumsCell cell: AlbumsCellView, AtIndexpath indexpath: IndexPath)
}
protocol TracksRouterProtocol {
}
protocol TracksInteractorInPutProtocol {
    var presenter: TracksInteractorOutPutProtocol? {get set}
    func getData()
}
protocol TracksInteractorOutPutProtocol: class {
    func tracksFetchedSucsessfully(tracks: [Track])
    func failedToFetchData(stringError err: String)
    func albumsFetchedSucsessfully(albums: [Album])
}
protocol TracksCellView {
    func configure(cellModel: Track)
}
protocol AlbumsCellView {
    func configure(cellModel: Album)
}
