//
//  HomeCell.swift
//  Siizamo
//
//  Created by Javier on 03/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCell: UITableViewCell {
    
    //Labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //Image View
    @IBOutlet weak var homeImgView: UIImageView!
    
    
    func configCell(home: Home, index: Int){
        self.titleLabel.text = home.titles[index]
        self.dateLabel.text = home.dates[index]
        let url = URL(string: home.profileImgs[index])
        self.homeImgView.kf_setImage(with: url)
    }
    
}
