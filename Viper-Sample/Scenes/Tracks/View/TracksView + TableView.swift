//
//  TracksView + TableView.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
extension TracksViewController: UITableViewDataSource, UITableViewDelegate {
    func setupTracksTable() {
        self.tracksTableView.delegate = self
        self.tracksTableView.dataSource = self
        self.tracksTableView.register(TracksCell.self, forCellReuseIdentifier: NSStringFromClass(TracksCell.self))
        self.tracksTableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        self.tracksTableView.scrollIndicatorInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        self.tracksTableView.indicatorStyle = .default
        self.tracksTableView.showsVerticalScrollIndicator = false
        self.tracksTableView.separatorStyle = .none
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TracksCell.self)) as? TracksCell else {return UITableViewCell()}
        presenter.configure(tracksCell: cell, AtIndexpath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let transform = CATransform3DTranslate(CATransform3DIdentity, 0, 100, 0)
        cell.alpha = 0
        cell.layer.transform = transform
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tracksTableView.cellForRow(at: indexPath) as? TracksCell {
            self.animateImageViewCell(imageView: cell.trackImage)
        }
    }
    func animateImageViewCell(imageView: UIImageView) {
        self.statusImageView = imageView
        if let startingFrame = imageView.superview?.convert(imageView.frame, to: nil) {
            imageView.alpha = 0
            self.backgroundView.frame = self.view.frame
            self.backgroundView.backgroundColor = .black
            self.backgroundView.alpha = 0
            self.view.addSubview(backgroundView)
            self.zoomingImageView.backgroundColor = .red
            self.zoomingImageView.frame = startingFrame
            self.zoomingImageView.isUserInteractionEnabled = true
            self.zoomingImageView.image = imageView.image
            self.zoomingImageView.contentMode = .scaleAspectFill
            self.zoomingImageView.clipsToBounds = true
            view.addSubview(self.zoomingImageView)
            self.zoomingImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOut)))
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                self.zoomingImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.backgroundView.alpha = 1
            }) { (_) in
                print("Done")
            }
        }
    }
    @objc func zoomOut() {
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            UIView.animate(withDuration: 0.3, animations: {
                self.zoomingImageView.frame = startingFrame
                self.backgroundView.alpha = 0
            }) { (_) in
                self.zoomingImageView.removeFromSuperview()
                self.backgroundView.removeFromSuperview()
                self.statusImageView.alpha = 1
            }
        }
    }
}
