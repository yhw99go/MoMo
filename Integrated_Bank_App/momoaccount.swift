//
//  momoaccount.swift
//  Integrated_Bank_App
//
//  Created by Dong Jun Park on 2018-02-20.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import Foundation

class MomoAccount {
    var email: String = ""
    var password: String = ""
    var fullname: String = ""
    var birth: String = ""
    
    init (email: String, password: String, fullname: String, birth: String) {
        self.email = email
        self.password = password
        self.fullname = fullname
        self.birth = birth
    }
}
