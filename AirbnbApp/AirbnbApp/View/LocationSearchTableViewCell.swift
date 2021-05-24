//
//  LocationSearchTableViewCell.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/21.
//

import UIKit

class LocationSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
   // @IBOutlet weak var minutesAway: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureLocationLabel(text: String) {
        self.locationLabel.text = text
    }
    
}
