//
//  VideoListVC+TableView.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/19/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import Foundation
import UIKit
import  AVKit

extension VideoListVC: UITableViewDataSource, UITableViewDelegate {
    func setupTableView() {
        videosTableView.dataSource = self
        videosTableView.delegate = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getVideosCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCellIdentifier") as! VideoCell

        presenter.configure(cell: cell, for: indexPath.row)
        cell.playVideoBtn.tag = indexPath.row
        cell.playVideoBtn.addTarget(self, action: #selector(playSmallPlayer(sender:)), for: .touchUpInside)

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
   
}
