//
//  BillTableViewCell.swift
//  Q_Tip_Cal
//
//  Created by MAC on 11/2/15.
//  Copyright © 2015 MAC. All rights reserved.
//

import UIKit

class BillTableViewCell: UITableViewCell {
    
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
