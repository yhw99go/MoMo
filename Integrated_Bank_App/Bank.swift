//
//  Bank.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import Foundation

class Bank{
    var bankname: String = ""
    var imageUrl: String = ""
    
    init (bankname: String, imageUrl: String) {
        self.bankname = bankname
        self.imageUrl = imageUrl
    }
}
