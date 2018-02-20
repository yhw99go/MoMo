//
//  Transaction.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-19.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import Foundation

class Transaction {
    var sentamount: String = ""
    var senttime: String = ""
    var sentaccount: String = ""
    var recipientaccount: String = ""
    
    init (sentamount: String, senttime: String, sentaccount: String, recipientaccount: String) {
        self.sentamount = sentamount
        self.senttime = senttime
        self.sentaccount = sentaccount
        self.recipientaccount = recipientaccount
    }
}
