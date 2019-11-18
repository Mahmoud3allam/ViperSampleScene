//
//  TracksView + CollectionView.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/17/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
extension TracksViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupAlbumsCollection() {
        self.albumsCollectionView.delegate = self
        self.albumsCollectionView.dataSource = self
        self.albumsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.albumsCollectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.albumsCollectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: NSStringFromClass(AlbumsCell.self))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.albumsNumberOfRow()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(AlbumsCell.self), for: indexPath) as? AlbumsCell else {
            return UICollectionViewCell()
        }
        presenter.configure(albumsCell: cell, AtIndexpath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: self.albumsCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: cell.frame.origin.y )
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1.0
            cell.transform = .identity
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = self.albumsCollectionView.cellForItem(at: indexPath) as? AlbumsCell {
            self.animateImageViewCell(imageView: cell.albumImage)
        }
    }
}
