//
//  CustomTableTableViewCell.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-18.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var accountImageView : UIImageView!
    @IBOutlet var accountNumber : UILabel!
    @IBOutlet var accountBalance : UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
