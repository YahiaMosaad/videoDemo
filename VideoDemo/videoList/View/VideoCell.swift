//
//  VideoCell.swift
//  VideoDemo
//
//  Created by Yahia Mosaad on 11/18/19.
//  Copyright © 2019 YahiaMosaad. All rights reserved.
//

import UIKit
import Foundation

class VideoCell: UITableViewCell, VideoCellView {
    //MARK: Outlets
    @IBOutlet weak var videoTitleLbl: UILabel!
    @IBOutlet weak var videoDescLbl: UILabel!
    @IBOutlet weak var videoThumbnail: UIImageView!
    @IBOutlet weak var playVideoBtn: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayVideoName(name: String) {
        videoTitleLbl.text = name
    }
    func displayDetails(desc: String) {
        videoDescLbl.text = desc
    }
    func displayImage(imageName: String) {
        videoThumbnail.image = UIImage(named: imageName)
        videoThumbnail.maskCircle(anyImage: videoThumbnail.image!)
    }
}
