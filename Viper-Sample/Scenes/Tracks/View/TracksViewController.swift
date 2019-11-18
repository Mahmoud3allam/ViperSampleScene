//
//  ViewController.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import Rswift
class TracksViewController: UIViewController {
    let tracksTableView: UITableView = {
        var desiredTable = UITableView()
        desiredTable.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        desiredTable.translatesAutoresizingMaskIntoConstraints = false
        return desiredTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTracksTableView()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()

    }
    private func setupTracksTableView() {
        self.view.addSubview(self.tracksTableView)
        self.tracksTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.tracksTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        self.tracksTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tracksTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
    }

}
