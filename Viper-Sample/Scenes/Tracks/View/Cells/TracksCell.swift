//
//  TracksCell.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/13/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
import Rswift
import Kingfisher
class TracksCell: UITableViewCell, TracksCellView {
    var trackImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    var atristLabel: UILabel = {
        var label = UILabel()
        label.textColor = .random
        label.font = R.font.workSansBold(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(cellModel: Track) {
        self.atristLabel.text = cellModel.name
        if let stringImage = cellModel.trackArtWork {
            if let recourse = URL(string: stringImage) {
                trackImage.kf.indicatorType = .activity
                self.trackImage.kf.setImage(with: recourse)
            } else {
                print("Can not find Track Image")
                self.trackImage.image = #imageLiteral(resourceName: "Screen Shot 2019-07-08 at 7.12.37 PM")
            }
        }
    }
    private func setupViews() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.addSubview(self.trackImage)
        self.addSubview(self.atristLabel)
        self.trackImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.trackImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.trackImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.trackImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        //Artist Label
        self.atristLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.atristLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.atristLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        self.atristLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
//Artist

//Album

//Image
