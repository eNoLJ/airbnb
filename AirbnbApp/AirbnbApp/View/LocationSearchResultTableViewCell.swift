//
//  LocationSearchResultTableViewCell.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/26.
//

import UIKit

class LocationSearchResultTableViewCell: UITableViewCell {

    @IBOutlet var ResultLocationImage: UIImageView!
    @IBOutlet var ResultLocationLabel: UILabel!
    static var nibName: String {
        return String(describing: self)
      }
    static var cellID: String = "resultCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureLocationLabel(text: String) {
        self.ResultLocationLabel.text = text
    }
    
}
