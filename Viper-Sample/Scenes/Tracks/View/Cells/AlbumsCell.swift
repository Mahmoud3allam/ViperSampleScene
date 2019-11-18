//
//  AlbumsCell.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/17/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class AlbumsCell: UICollectionViewCell, AlbumsCellView {
    let albumImage: UIImageView = {
        var album = UIImageView()
        album.contentMode = .scaleAspectFill
        album.translatesAutoresizingMaskIntoConstraints = false
        album.clipsToBounds = true
        album.layer.cornerRadius = 16
        album.layer.masksToBounds = true
        return album
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 16
        self.addSubview(self.albumImage)
        self.albumImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.albumImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.albumImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.albumImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    func configure(cellModel: Album) {
        if let stringImage = cellModel.albumArtWork {
            if let resources = URL(string: stringImage) {
                self.albumImage.kf.setImage(with: resources)
            }
        }
    }
}
