//
//  AddTableViewCell.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import UIKit

class AddTableViewCell: UITableViewCell {
    
    @IBOutlet var bankImageView : UIImageView!
    @IBOutlet var bankName : UILabel!
    
    @IBOutlet var addButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
