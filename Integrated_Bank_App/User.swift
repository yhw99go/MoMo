//
//  User.swift
//  Integrated_Bank_App
//
//  Created by Hyeong Ook Yu on 2018-02-20.
//  Copyright © 2018 OrganizationName. All rights reserved.
//

import Foundation
class User {
    private var UserName : String = ""
    private var PassWord : String = ""
    private var Account  : Account;
    private var TransactionList: [Transaction] = [];

    init (username: String, password: String, account: Account) {
        self.UserName = username;
        self.PassWord = password;
        self.Account = account;
    }
    
    func getTransaction(tr : Transaction) -> Transaction? {
        for t in TransactionList {
            if(tr === t){
                return t;
            }
        }
        return nil;
    }
    
    
    
}
