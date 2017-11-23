//
//  SearchCell.swift
//  Siizamo
//
//  Created by Javier on 06/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

    //Labels
    @IBOutlet weak var slugLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    //Image Views
    @IBOutlet weak var searchImgView: UIImageView!
    
    func configCell(search: Search, index: Int) {
        titleLabel.text = search.titles[index]
        dateLabel.text = search.dates[index]
        slugLabel.text = search.slugs[index]
        searchImgView.kf_setImage(with: URL(string: search.profileImgs[index]))
    }

}
