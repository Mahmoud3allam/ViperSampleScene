//
//  ViewController.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import Rswift
class TracksViewController: UIViewController, TracksViewProtocol {
    var presenter: TracksPresenterProtocol!
    let tracksTableView: UITableView = {
        var desiredTable = UITableView()
        desiredTable.backgroundColor = .clear
        desiredTable.translatesAutoresizingMaskIntoConstraints = false
        return desiredTable
    }()
    let albumsCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var desiredCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        desiredCollection.showsHorizontalScrollIndicator = false
        desiredCollection.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        desiredCollection.translatesAutoresizingMaskIntoConstraints = false
        return desiredCollection
    }()
    let indicatorView: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        indicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    let backgroundView = UIView()
    var statusImageView = UIImageView()
    let zoomingImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupAlbumsCollection()
        self.setupTracksTable()
        presenter.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        self.addViews()
    }
    private func addViews() {
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(self.albumsCollectionView)
        self.view.addSubview(self.tracksTableView)
        self.view.addSubview(self.indicatorView)
        self.indicatorView.center = self.view.center
        //Collection
        self.albumsCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32).isActive = true
        self.albumsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.albumsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.albumsCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        //Table
        self.tracksTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.tracksTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        self.tracksTableView.topAnchor.constraint(equalTo: self.albumsCollectionView.bottomAnchor, constant: 16).isActive = true
        self.tracksTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
        //indicator
        self.indicatorView.centerYAnchor.constraint(equalTo: self.tracksTableView.centerYAnchor, constant: 0).isActive = true
        self.indicatorView.centerXAnchor.constraint(equalTo: self.tracksTableView.centerXAnchor, constant: 0).isActive = true
        self.indicatorView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.indicatorView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    func showLoadingIndicator() {
        print("View showing indicator")
        DispatchQueue.main.async {
            self.indicatorView.startAnimating()
        }
    }
    func hideLoadingIndicator() {
        print("View hiding indicator")
        DispatchQueue.main.async {
            self.indicatorView.stopAnimating()
        }
    }
    func reloadTracksData() {
        print("fetched Tracks Sucsessfully")
        DispatchQueue.main.async {
            self.tracksTableView.reloadData()
        }
    }
    func reloadAlbumsData() {
        print("fetched Albums Sucsessfully")
        DispatchQueue.main.async {
            self.albumsCollectionView.reloadData()
        }
    }
    func showAlert(withTitle title: String) {
        print("Show Error With Title \(title)")
    }
}
