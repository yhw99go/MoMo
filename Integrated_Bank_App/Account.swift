//
//  Account.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-18.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import Foundation

class Account {
    var bankname: String = ""
    var accountnumber: String = ""
    var balance: Float = 0
    var imageUrl: String = ""
    
    init (bankname: String, accountnumber: String, balance: Float, imageUrl: String) {
        self.bankname = bankname
        self.accountnumber = accountnumber
        self.balance = balance
        self.imageUrl = imageUrl
    }
}
