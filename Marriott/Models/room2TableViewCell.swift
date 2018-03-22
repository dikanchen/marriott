//
//  room2TableViewCell.swift
//  Marriott
//
//  Created by User on 3/17/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

class room2TableViewCell: UITableViewCell {

    @IBOutlet weak var ratedetailBtn: UIButton!
    @IBOutlet weak var roomdetailBtn: UIButton!
    @IBOutlet weak var roomnameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
