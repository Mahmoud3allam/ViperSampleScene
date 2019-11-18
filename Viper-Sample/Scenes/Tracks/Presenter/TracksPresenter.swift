//
//  TracksPresenter.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
class TracksPresenter: TracksPresenterProtocol, TracksInteractorOutPutProtocol {
    weak var view: TracksViewProtocol?
    private let interactor: TracksInteractorInPutProtocol
    private let router: TracksRouterProtocol
    private var desiredTracks = [Track]()
    private var desiredAlbums = [Album]()
    init(view: TracksViewProtocol, interactor: TracksInteractorInPutProtocol, router: TracksRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getData()
    }
    func numOfRows() -> Int {
        return desiredTracks.count
    }
    func configure(tracksCell cell: TracksCellView, AtIndexpath indexPath: IndexPath) {
         let singleTrack = self.desiredTracks[indexPath.item]
        //pass Data to the cell Components
        cell.configure(cellModel: singleTrack)
    }
    func tracksFetchedSucsessfully(tracks: [Track]) {
        view?.hideLoadingIndicator()
        self.desiredTracks = tracks
        view?.reloadTracksData()
    }
    func failedToFetchData(stringError err: String) {
        view?.hideLoadingIndicator()
        view?.showAlert(withTitle: err)
    }
    func albumsNumberOfRow() -> Int {
        return desiredAlbums.count
    }
    func albumsFetchedSucsessfully(albums: [Album]) {
        view?.hideLoadingIndicator()
        self.desiredAlbums = albums
        view?.reloadAlbumsData()
    }
    func configure(albumsCell cell: AlbumsCellView, AtIndexpath indexpath: IndexPath) {
        //pass Data to cell Components
        let singleAlbum = self.desiredAlbums[indexpath.item]
        cell.configure(cellModel: singleAlbum)
    }
}
